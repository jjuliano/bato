# frozen_string_literal: true

module RubyParserStuff
  class Keyword
    pang_kapahayagang_mga_salita = [
      ['katapusan',            %i[kEND kEND],                   :expr_end],
      ['dulo',                 %i[kEND kEND],                   :expr_end],
      ['wakas',                %i[kEND kEND],                   :expr_end],
      ['ang',                  %i[kDEF kDEF],                   :expr_fname],
      ['panuntunang',          %i[kDEF kDEF],                   :expr_fname],
      ['panuntunan',           %i[kDEF kDEF],                   :expr_fname],
      ['iligtas',              %i[kRESCUE kRESCUE_MOD],         :expr_mid],
      ['agapan',               %i[kRESCUE kRESCUE_MOD],         :expr_mid],
      ['bigyang_daan',         %i[kYIELD kYIELD],               :expr_arg],
      ['magbigay_daan',        %i[kYIELD kYIELD],               :expr_arg],
      ['sariling',             %i[kSELF kSELF],                 :expr_end],
      ['sarili',               %i[kSELF kSELF],                 :expr_end],
      ['mali',                 %i[kFALSE kFALSE],               :expr_end],
      ['subukang_muli',        %i[kRETRY kRETRY],               :expr_end],
      ['ibalik',               %i[kRETURN kRETURN],             :expr_mid],
      ['ibalik_ang',           %i[kRETURN kRETURN],             :expr_mid],
      ['magbalik',             %i[kRETURN kRETURN],             :expr_mid],
      ['magbalik_nang',        %i[kRETURN kRETURN],             :expr_mid],
      ['isauli',               %i[kRETURN kRETURN],             :expr_mid],
      ['isauli_ang',           %i[kRETURN kRETURN],             :expr_mid],
      ['ibigay',               %i[kRETURN kRETURN],             :expr_mid],
      ['ibigay_ang',           %i[kRETURN kRETURN],             :expr_mid],
      ['magbigay',             %i[kRETURN kRETURN],             :expr_mid],
      ['magbigay_nang',        %i[kRETURN kRETURN],             :expr_mid],
      ['tama',                 %i[kTRUE kTRUE],                 :expr_end],
      ['totoo',                %i[kTRUE kTRUE],                 :expr_end],
      ['tunay',                %i[kTRUE kTRUE],                 :expr_end],
      ['katotohanan',          %i[kTRUE kTRUE],                 :expr_end],
      ['nakatukoy?',           %i[kDEFINED kDEFINED],           :expr_arg],
      ['nakasaad?',            %i[kDEFINED kDEFINED],           :expr_arg],
      ['tanggalin',            %i[kUNDEF kUNDEF],               :expr_fname],
      ['magtanggal',           %i[kUNDEF kUNDEF],               :expr_fname],
      ['ihinto',               %i[kBREAK kBREAK],               :expr_mid],
      ['hinto',                %i[kBREAK kBREAK],               :expr_mid],
      ['wala',                 %i[kNIL kNIL],                   :expr_end],
      ['sumunod',              %i[kNEXT kNEXT],                 :expr_mid],
      ['kasunod',              %i[kNEXT kNEXT],                 :expr_mid],
      ['ulitin',               %i[kREDO kREDO],                 :expr_end],
      ['at_ulitin',            %i[kREDO kREDO],                 :expr_end],
      ['uliting_muli',         %i[kREDO kREDO],                 :expr_end],
      ['bilang',               %i[kCLASS kCLASS],               :expr_class],
      ['klase',                %i[kCLASS kCLASS],               :expr_class],
      ['alyas',                %i[kALIAS kALIAS],               :expr_fname],
      ['iba',                  %i[kELSE kELSE],                 :expr_beg],
      ['kung_iba',             %i[kELSE kELSE],                 :expr_beg],
      ['kung_hindi_naman',     %i[kELSE kELSE],                 :expr_beg],
      ['kapag_hindi',          %i[kELSE kELSE],                 :expr_beg],
      ['kapag_hindi_naman',    %i[kELSE kELSE],                 :expr_beg],
      ['kung_hindi_pa',        %i[kELSE kELSE],                 :expr_beg],
      ['kapag_hindi_pa',       %i[kELSE kELSE],                 :expr_beg],
      ['at_kung_hindi',        %i[kELSE kELSE],                 :expr_beg],
      ['at_kapag_hindi',       %i[kELSE kELSE],                 :expr_beg],
      ['at_kung_hindi_naman',  %i[kELSE kELSE],                 :expr_beg],
      ['at_kapag_hindi_naman', %i[kELSE kELSE],                 :expr_beg],
      ['at_kung_hindi_pa',     %i[kELSE kELSE],                 :expr_beg],
      ['at_kapag_hindi_pa',    %i[kELSE kELSE],                 :expr_beg],
      ['maliban_dito',         %i[kELSE kELSE],                 :expr_beg],
      ['maliban_sa_mga_ito',   %i[kELSE kELSE],                 :expr_beg],
      ['matiyak',              %i[kENSURE kENSURE],             :expr_beg],
      ['tiyakin',              %i[kENSURE kENSURE],             :expr_beg],
      ['tiyaking',             %i[kENSURE kENSURE],             :expr_beg],
      ['siguraduhing',         %i[kENSURE kENSURE],             :expr_beg],
      ['siguraduhin',          %i[kENSURE kENSURE],             :expr_beg],
      ['panigurado',           %i[kENSURE kENSURE],             :expr_beg],
      ['kung_hindi',           %i[kELSE kELSE],                 :expr_beg],
      ['dapat',                %i[kTHEN kTHEN],                 :expr_beg],
      ['na_ganito',            %i[kDO kDO],                     :expr_beg],
      ['nang_ganito',          %i[kDO kDO],                     :expr_beg],
      ['ng_ganito',            %i[kDO kDO],                     :expr_beg],
      ['ganito',               %i[kDO kDO],                     :expr_beg],
      ['ganito_gawin',         %i[kDO kDO],                     :expr_beg],
      ['ganito_ang_gagawin',   %i[kDO kDO],                     :expr_beg],
      ['simula',               %i[kBEGIN kBEGIN],               :expr_beg],
      ['simulan',              %i[kBEGIN kBEGIN],               :expr_beg]
    ]

    pang_ekspresyon_na_mga_salita = [
      ['at',                   %i[kAND kAND],                   :expr_beg],
      ['at_ang',               %i[kAND kAND],                   :expr_beg],
      ['kalagayan',            %i[kCASE kCASE],                 :expr_beg],
      ['kaukulan',             %i[kCASE kCASE],                 :expr_beg],
      ['sakaling',             %i[kCASE kCASE],                 :expr_beg],
      ['sakali',               %i[kCASE kCASE],                 :expr_beg],
      ['kung_sakaling',        %i[kCASE kCASE],                 :expr_beg],
      ['sakali_na',            %i[kCASE kCASE],                 :expr_beg],
      ['kung_sakali_na',       %i[kCASE kCASE],                 :expr_beg],
      ['ngunit_kapag',         %i[kELSIF kELSIF],               :expr_beg],
      ['kung_kapag',           %i[kELSIF kELSIF],               :expr_beg],
      ['ngunit_kapag_ang',     %i[kELSIF kELSIF],               :expr_beg],
      ['kung_kapag_ang',       %i[kELSIF kELSIF],               :expr_beg],
      ['para_sa',              %i[kFOR kFOR],                   :expr_beg],
      ['para_ang',             %i[kFOR kFOR],                   :expr_beg],
      ['kapag',                %i[kIF kIF_MOD],                 :expr_beg],
      ['kapag_ang',            %i[kIF kIF_MOD],                 :expr_beg],
      ['kapag_na_ang',         %i[kIF kIF_MOD],                 :expr_beg],
      ['kung',                 %i[kIF kIF_MOD],                 :expr_beg],
      ['kung_ang',             %i[kIF kIF_MOD],                 :expr_beg],
      ['sa',                   %i[kIN kIN],                     :expr_beg],
      ['sa_loob_ng',           %i[kIN kIN],                     :expr_beg],
      ['nasa',                 %i[kIN kIN],                     :expr_beg],
      ['na_nasa',              %i[kIN kIN],                     :expr_beg],
      ['modyul',               %i[kMODULE kMODULE],             :expr_beg],
      ['grupo',                %i[kMODULE kMODULE],             :expr_beg],
      ['o',                    %i[kOR kOR],                     :expr_beg],
      ['o_ang',                %i[kOR kOR],                     :expr_beg],
      ['malibang',             %i[kUNLESS kUNLESS_MOD],         :expr_beg],
      ['maliban_na',           %i[kUNLESS kUNLESS_MOD],         :expr_beg],
      ['maliban_ang',          %i[kUNLESS kUNLESS_MOD],         :expr_beg],
      ['hanggang',             %i[kUNTIL kUNTIL_MOD],           :expr_beg],
      ['hanggang_ang',         %i[kUNTIL kUNTIL_MOD],           :expr_beg],
      ['mapa_hanggang',        %i[kUNTIL kUNTIL_MOD],           :expr_beg],
      ['pagka',                %i[kWHEN kWHEN],                 :expr_beg],
      ['pagka_ang',            %i[kWHEN kWHEN],                 :expr_beg],
      ['ay',                   %i[kWHEN kWHEN],                 :expr_beg],
      ['habang',               %i[kWHILE kWHILE_MOD],           :expr_beg],
      ['habang_ang',           %i[kWHILE kWHILE_MOD],           :expr_beg]
    ]

    pang_internal_na_mekanismo_na_mga_salita = [
      ['END',                  %i[klEND klEND],                 :expr_end],
      ['BEGIN',                %i[klBEGIN klBEGIN],             :expr_end],
      ['super',                %i[kSUPER kSUPER],               :expr_arg],
      ['__FILE__',             %i[k__FILE__ k__FILE__],         :expr_end],
      ['__LINE__',             %i[k__LINE__ k__LINE__],         :expr_end],
      ['__ENCODING__',         %i[k__ENCODING__ k__ENCODING__], :expr_end]
    ]

    pang_argumentong_mga_salita = [
      ['hindi',                %i[kNOT kNOT],                   :expr_beg]
    ]

    original_verbosity = $VERBOSE
    $VERBOSE = nil

    mga_salita = [
      pang_kapahayagang_mga_salita,
      pang_ekspresyon_na_mga_salita,
      pang_internal_na_mekanismo_na_mga_salita,
      pang_argumentong_mga_salita
    ].flatten(1).map { |args| KWtable.new(*args) }

    WORDLIST18 = Hash[*mga_salita.map { |o| [o.name, o] }.flatten]
    WORDLIST19 = Hash[*mga_salita.map { |o| [o.name, o] }.flatten]

    $VERBOSE = original_verbosity

    WORDLIST18.delete '__ENCODING__'

    pang_ekspresyon_na_mga_salita.each do |k|
      WORDLIST19[k[0]] = WORDLIST19[k[0]].dup
      WORDLIST19[k[0]].state = :expr_value
    end

    pang_argumentong_mga_salita.each do |k|
      WORDLIST19[k[0]] = WORDLIST19[k[0]].dup
      WORDLIST19[k[0]].state = :expr_arg
    end
  end
end
