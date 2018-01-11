class RubyLexer
  def parse_number
    self.lex_state = :expr_end

    if src.scan(/[+-]?0[xXbBdD]\b/)
      rb_compile_error 'Invalid numeric format'
    # elsif src.scan(/[+-]?(?:(?:[1-9][\d_]*|0)(?!\.\d)\b|0[Dd][0-9_]+)/)
    elsif src.scan(/[+-]?(?:(?:[1-9][\d_]*|0)(?!\,\d)\b|0[Dd][0-9_]+)/)
      int_with_base(10)
    elsif src.scan(/[+-]?0x[a-f0-9_]+/i)
      int_with_base(16)
    elsif src.scan(/[+-]?0[Bb][01_]+/)
      int_with_base(2)
    elsif src.scan(/[+-]?0[Oo]?[0-7_]*[89]/)
      rb_compile_error 'Illegal octal digit.'
    elsif src.scan(/[+-]?0[Oo]?[0-7_]+|0[Oo]/)
      int_with_base(8)
    elsif src.scan(/[+-]?[\d_]+_(e|\.)/)
      rb_compile_error "Trailing '_' in number."
    # elsif src.scan(/[+-]?[\d_]+\.[\d_]+(e[+-]?[\d_]+)?\b|[+-]?[\d_]+e[+-]?[\d_]+\b/i)
    elsif src.scan(/[+-]?[\d_]+\,[\d_]+(e[+-]?[\d_]+)?\b|[+-]?[\d_]+e[+-]?[\d_]+\b/i)
      number = src.matched.sub(',', '.')
      rb_compile_error 'Invalid numeric format' if number =~ /__/
      self.yacc_value = number.to_f
      :tFLOAT
    elsif src.scan(/[+-]?[0-9_]+(?![e])/)
      int_with_base(10)
    else
      rb_compile_error 'Bad number format'
    end
  end
end

module RubyParserStuff
  class Keyword
    wordlist = [
      ['katapusan',            %i[kEND kEND], :expr_end],
      ['dulo',                 %i[kEND kEND], :expr_end],
      ['wakas',                %i[kEND kEND], :expr_end],
      ['iba',                  %i[kELSE kELSE], :expr_beg],
      ['kung_iba',             %i[kELSE kELSE], :expr_beg],
      ['kung_hindi',           %i[kELSE kELSE], :expr_beg],
      ['kung_hindi_naman',     %i[kELSE kELSE], :expr_beg],
      ['kapag_hindi',          %i[kELSE kELSE], :expr_beg],
      ['kapag_hindi_naman',    %i[kELSE kELSE], :expr_beg],
      ['kung_hindi_pa',        %i[kELSE kELSE], :expr_beg],
      ['kapag_hindi_pa',       %i[kELSE kELSE], :expr_beg],
      ['at_kung_hindi',        %i[kELSE kELSE], :expr_beg],
      ['at_kapag_hindi',       %i[kELSE kELSE], :expr_beg],
      ['at_kung_hindi_naman',  %i[kELSE kELSE], :expr_beg],
      ['at_kapag_hindi_naman', %i[kELSE kELSE], :expr_beg],
      ['at_kung_hindi_pa',     %i[kELSE kELSE], :expr_beg],
      ['at_kapag_hindi_pa',    %i[kELSE kELSE], :expr_beg],
      ['maliban_dito',         %i[kELSE kELSE], :expr_beg],
      ['maliban_sa_mga_ito',   %i[kELSE kELSE], :expr_beg],
      ['kalagayan',            %i[kCASE kCASE], :expr_beg],
      ['kaukulan',             %i[kCASE kCASE], :expr_beg],
      ['sakaling',             %i[kCASE kCASE], :expr_beg],
      ['sakali',               %i[kCASE kCASE], :expr_beg],
      ['kung_sakaling',        %i[kCASE kCASE], :expr_beg],
      ['sakali_na',            %i[kCASE kCASE], :expr_beg],
      ['kung_sakali_na',       %i[kCASE kCASE], :expr_beg],
      ['matiyak',              %i[kENSURE kENSURE], :expr_beg],
      ['tiyakin',              %i[kENSURE kENSURE], :expr_beg],
      ['tiyaking',             %i[kENSURE kENSURE], :expr_beg],
      ['siguraduhing',         %i[kENSURE kENSURE], :expr_beg],
      ['siguraduhin',          %i[kENSURE kENSURE], :expr_beg],
      ['panigurado',           %i[kENSURE kENSURE], :expr_beg],
      ['modyul',               %i[kMODULE kMODULE], :expr_beg],
      ['grupo',                %i[kMODULE kMODULE], :expr_beg],
      ['ngunit_kapag',         %i[kELSIF kELSIF], :expr_beg],
      ['kung_kapag',           %i[kELSIF kELSIF], :expr_beg],
      ['ngunit_kapag_ang',     %i[kELSIF kELSIF], :expr_beg],
      ['kung_kapag_ang',       %i[kELSIF kELSIF], :expr_beg],
      ['ang',                  %i[kDEF kDEF], :expr_fname],
      ['panuntunang',          %i[kDEF kDEF], :expr_fname],
      ['panuntunan',           %i[kDEF kDEF], :expr_fname],
      ['iligtas',              %i[kRESCUE kRESCUE_MOD], :expr_mid],
      ['agapan',               %i[kRESCUE kRESCUE_MOD], :expr_mid],
      ['hindi',                %i[kNOT kNOT], :expr_beg],
      ['dapat',                %i[kTHEN kTHEN], :expr_beg],
      ['bigyang_daan',         %i[kYIELD kYIELD], :expr_arg],
      ['magbigay_daan',        %i[kYIELD kYIELD], :expr_arg],
      ['para_sa',              %i[kFOR kFOR], :expr_beg],
      ['para_ang',             %i[kFOR kFOR], :expr_beg],
      ['sariling',             %i[kSELF kSELF], :expr_end],
      ['sarili',               %i[kSELF kSELF], :expr_end],
      ['mali',                 %i[kFALSE kFALSE], :expr_end],
      ['subukang_muli',        %i[kRETRY kRETRY], :expr_end],
      ['ibalik',               %i[kRETURN kRETURN], :expr_mid],
      ['ibalik_ang',           %i[kRETURN kRETURN], :expr_mid],
      ['magbalik',             %i[kRETURN kRETURN], :expr_mid],
      ['magbalik_nang',        %i[kRETURN kRETURN], :expr_mid],
      ['isauli',               %i[kRETURN kRETURN], :expr_mid],
      ['isauli_ang',           %i[kRETURN kRETURN], :expr_mid],
      ['ibigay',               %i[kRETURN kRETURN], :expr_mid],
      ['ibigay_ang',           %i[kRETURN kRETURN], :expr_mid],
      ['magbigay',             %i[kRETURN kRETURN], :expr_mid],
      ['magbigay_nang',        %i[kRETURN kRETURN], :expr_mid],
      ['tama',                 %i[kTRUE kTRUE], :expr_end],
      ['totoo',                %i[kTRUE kTRUE], :expr_end],
      ['tunay',                %i[kTRUE kTRUE], :expr_end],
      ['katotohanan',          %i[kTRUE kTRUE], :expr_end],
      ['kapag',                %i[kIF kIF_MOD], :expr_beg],
      ['kapag_ang',            %i[kIF kIF_MOD], :expr_beg],
      ['kapag_na_ang',         %i[kIF kIF_MOD], :expr_beg],
      ['kung',                 %i[kIF kIF_MOD], :expr_beg],
      ['kung_ang',             %i[kIF kIF_MOD], :expr_beg],
      ['nakatukoy?',           %i[kDEFINED kDEFINED], :expr_arg],
      ['nakasaad?',            %i[kDEFINED kDEFINED], :expr_arg],
      ['super',                %i[kSUPER kSUPER], :expr_arg],
      ['tanggalin',            %i[kUNDEF kUNDEF], :expr_fname],
      ['magtanggal',           %i[kUNDEF kUNDEF], :expr_fname],
      ['ihinto',               %i[kBREAK kBREAK], :expr_mid],
      ['hinto',                %i[kBREAK kBREAK], :expr_mid],
      ['sa',                   %i[kIN kIN], :expr_beg],
      ['sa_loob_ng',           %i[kIN kIN], :expr_beg],
      ['nasa',                 %i[kIN kIN], :expr_beg],
      ['na_nasa',              %i[kIN kIN], :expr_beg],
      ['na_ganito',            %i[kDO kDO], :expr_beg],
      ['nang_ganito',          %i[kDO kDO], :expr_beg],
      ['ng_ganito',            %i[kDO kDO], :expr_beg],
      ['ganito',               %i[kDO kDO], :expr_beg],
      ['ganito_gawin',         %i[kDO kDO], :expr_beg],
      ['ganito_ang_gagawin',   %i[kDO kDO], :expr_beg],
      ['wala',                 %i[kNIL kNIL], :expr_end],
      ['hanggang',             %i[kUNTIL kUNTIL_MOD], :expr_beg],
      ['hanggang_ang',         %i[kUNTIL kUNTIL_MOD], :expr_beg],
      ['mapa_hanggang',        %i[kUNTIL kUNTIL_MOD], :expr_beg],
      ['malibang',             %i[kUNLESS kUNLESS_MOD], :expr_beg],
      ['maliban_na',           %i[kUNLESS kUNLESS_MOD], :expr_beg],
      ['maliban_ang',          %i[kUNLESS kUNLESS_MOD], :expr_beg],
      ['o',                    %i[kOR kOR], :expr_beg],
      ['o_ang',                %i[kOR kOR], :expr_beg],
      ['sumunod',              %i[kNEXT kNEXT], :expr_mid],
      ['kasunod',              %i[kNEXT kNEXT], :expr_mid],
      ['pagka',                %i[kWHEN kWHEN], :expr_beg],
      ['pagka_ang',            %i[kWHEN kWHEN], :expr_beg],
      ['ay',                   %i[kWHEN kWHEN], :expr_beg],
      ['ulitin',               %i[kREDO kREDO], :expr_end],
      ['at_ulitin',            %i[kREDO kREDO], :expr_end],
      ['uliting_muli',         %i[kREDO kREDO], :expr_end],
      ['at',                   %i[kAND kAND], :expr_beg],
      ['at_ang',               %i[kAND kAND], :expr_beg],
      ['simula',               %i[kBEGIN kBEGIN], :expr_beg],
      ['simulan',              %i[kBEGIN kBEGIN], :expr_beg],
      ['__LINE__',             %i[k__LINE__ k__LINE__], :expr_end],
      ['bilang',               %i[kCLASS kCLASS], :expr_class],
      ['klase',                %i[kCLASS kCLASS], :expr_class],
      ['__FILE__',             %i[k__FILE__ k__FILE__], :expr_end],
      ['END',                  %i[klEND klEND], :expr_end],
      ['BEGIN',                %i[klBEGIN klBEGIN], :expr_end],
      ['habang',               %i[kWHILE kWHILE_MOD], :expr_beg],
      ['habang_ang',           %i[kWHILE kWHILE_MOD], :expr_beg],
      ['alyas',                %i[kALIAS kALIAS], :expr_fname],
      ['__ENCODING__',         %i[k__ENCODING__ k__ENCODING__], :expr_end]
    ].map { |args| KWtable.new(*args) }

    # :startdoc:

    original_verbosity = $VERBOSE
    $VERBOSE = nil

    WORDLIST18 = Hash[*wordlist.map { |o| [o.name, o] }.flatten]
    WORDLIST19 = Hash[*wordlist.map { |o| [o.name, o] }.flatten]

    $VERBOSE = original_verbosity

    WORDLIST18.delete '__ENCODING__'

    %w[at at_ang
       kalagayan kaukulan sakaling sakali kung_sakaling sakali_na kung_sakali_na
       ngunit_kapag kung_kapag ngunit_kapag_ang kung_kapag_ang
       para_sa para_ang
       kapag kapag_ang kapag_na_ang kung kung_ang
       sa sa_loob_ng nasa na_nasa
       modyul grupo
       o o_ang
       malibang maliban_na maliban_ang
       hanggang hanggang_ang mapa_hanggang
       pagka pagka_ang ay
       habang habang_ang].each do |k|
      WORDLIST19[k] = WORDLIST19[k].dup
      WORDLIST19[k].state = :expr_value
    end
    %w[hindi].each do |k|
      WORDLIST19[k] = WORDLIST19[k].dup
      WORDLIST19[k].state = :expr_arg
    end
  end
end
