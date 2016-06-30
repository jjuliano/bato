# encoding: utf-8

class RubyLexer
  ##
  #  Parse a number from the input stream.
  #
  # @param c The first character of the number.
  # @return A int constant wich represents a token.

  def parse_number
    self.lex_state = :expr_end

    case
    when src.scan(/[+-]?0[xXbBdD]\b/) then
      rb_compile_error "Invalid numeric format"
    # when src.scan(/[+-]?(?:(?:[1-9][\d_]*|0)(?!\.\d)\b|0[Dd][0-9_]+)/) then
    when src.scan(/[+-]?(?:(?:[1-9][\d_]*|0)(?!\,\d)\b|0[Dd][0-9_]+)/) then
      int_with_base(10)
    when src.scan(/[+-]?0x[a-f0-9_]+/i) then
      int_with_base(16)
    when src.scan(/[+-]?0[Bb][01_]+/) then
      int_with_base(2)
    when src.scan(/[+-]?0[Oo]?[0-7_]*[89]/) then
      rb_compile_error "Illegal octal digit."
    when src.scan(/[+-]?0[Oo]?[0-7_]+|0[Oo]/) then
      int_with_base(8)
    when src.scan(/[+-]?[\d_]+_(e|\.)/) then
      rb_compile_error "Trailing '_' in number."
    # when src.scan(/[+-]?[\d_]+\.[\d_]+(e[+-]?[\d_]+)?\b|[+-]?[\d_]+e[+-]?[\d_]+\b/i) then
    when src.scan(/[+-]?[\d_]+\,[\d_]+(e[+-]?[\d_]+)?\b|[+-]?[\d_]+e[+-]?[\d_]+\b/i) then
      number = src.matched.sub(',', '.')
      if number =~ /__/ then
        rb_compile_error "Invalid numeric format"
      end
      self.yacc_value = number.to_f
      :tFLOAT
    when src.scan(/[+-]?[0-9_]+(?![e])/) then
      int_with_base(10)
    else
      rb_compile_error "Bad number format"
    end
  end

end

module RubyParserStuff
  class Keyword
    wordlist = [
      ["katapusan",            [:kEND,      :kEND        ], :expr_end   ],
      ["dulo",                 [:kEND,      :kEND        ], :expr_end   ],
      ["wakas",                [:kEND,      :kEND        ], :expr_end   ],
      ["iba",                  [:kELSE,     :kELSE       ], :expr_beg   ],      
      ["kung_hindi",           [:kELSE,     :kELSE       ], :expr_beg   ],
      ["kung_hindi_naman",     [:kELSE,     :kELSE       ], :expr_beg   ],
      ["kapag_hindi",          [:kELSE,     :kELSE       ], :expr_beg   ],
      ["kapag_hindi_naman",    [:kELSE,     :kELSE       ], :expr_beg   ],
      ["kung_hindi_pa",        [:kELSE,     :kELSE       ], :expr_beg   ],
      ["kapag_hindi_pa",       [:kELSE,     :kELSE       ], :expr_beg   ],
      ["at_kung_hindi",        [:kELSE,     :kELSE       ], :expr_beg   ],
      ["at_kapag_hindi",       [:kELSE,     :kELSE       ], :expr_beg   ],
      ["at_kung_hindi_naman",  [:kELSE,     :kELSE       ], :expr_beg   ],
      ["at_kapag_hindi_naman", [:kELSE,     :kELSE       ], :expr_beg   ],
      ["at_kung_hindi_pa",     [:kELSE,     :kELSE       ], :expr_beg   ],
      ["at_kapag_hindi_pa",    [:kELSE,     :kELSE       ], :expr_beg   ],
      ["maliban_dito",         [:kELSE,     :kELSE       ], :expr_beg   ],
      ["maliban_sa_mga_ito",   [:kELSE,     :kELSE       ], :expr_beg   ],
      ["kalagayan",            [:kCASE,     :kCASE       ], :expr_beg   ],
      ["kaukulan",             [:kCASE,     :kCASE       ], :expr_beg   ],      
      ["sakaling",             [:kCASE,     :kCASE       ], :expr_beg   ],
      ["sakali",               [:kCASE,     :kCASE       ], :expr_beg   ],
      ["kung_sakaling",        [:kCASE,     :kCASE       ], :expr_beg   ],
      ["sakali_na",            [:kCASE,     :kCASE       ], :expr_beg   ],
      ["kung_sakali_na",       [:kCASE,     :kCASE       ], :expr_beg   ],
      ["matiyak",              [:kENSURE,   :kENSURE     ], :expr_beg   ],
      ["tiyakin",              [:kENSURE,   :kENSURE     ], :expr_beg   ],
      ["tiyaking",             [:kENSURE,   :kENSURE     ], :expr_beg   ],
      ["siguraduhing",         [:kENSURE,   :kENSURE     ], :expr_beg   ],
      ["siguraduhin",          [:kENSURE,   :kENSURE     ], :expr_beg   ],
      ["panigurado",           [:kENSURE,   :kENSURE     ], :expr_beg   ],
      ["modyul",               [:kMODULE,   :kMODULE     ], :expr_beg   ],
      ["ngunit_kapag",         [:kELSIF,    :kELSIF      ], :expr_beg   ],
      ["kung_kapag",           [:kELSIF,    :kELSIF      ], :expr_beg   ],
      ["ngunit_kapag_ang",     [:kELSIF,    :kELSIF      ], :expr_beg   ],
      ["kung_kapag_ang",       [:kELSIF,    :kELSIF      ], :expr_beg   ],
      ["panuntunang",          [:kDEF,      :kDEF        ], :expr_fname ],
      ["panuntunan",           [:kDEF,      :kDEF        ], :expr_fname ],
      ["iligtas",              [:kRESCUE,   :kRESCUE_MOD ], :expr_mid   ],
      ["agapan",               [:kRESCUE,   :kRESCUE_MOD ], :expr_mid   ],
      ["hindi",                [:kNOT,      :kNOT        ], :expr_beg   ],
      ["dapat",                [:kTHEN,     :kTHEN       ], :expr_beg   ],
      ["bigyang_daan",         [:kYIELD,    :kYIELD      ], :expr_arg   ],
      ["magbigay_daan",        [:kYIELD,    :kYIELD      ], :expr_arg   ],
      ["para_sa",              [:kFOR,      :kFOR        ], :expr_beg   ],
      ["para_ang",             [:kFOR,      :kFOR        ], :expr_beg   ],
      ["self",                 [:kSELF,     :kSELF       ], :expr_end   ],
      ["mali",                 [:kFALSE,    :kFALSE      ], :expr_end   ],
      ["subukang_muli",        [:kRETRY,    :kRETRY      ], :expr_end   ],
      ["ibalik",               [:kRETURN,   :kRETURN     ], :expr_mid   ],
      ["magbalik",             [:kRETURN,   :kRETURN     ], :expr_mid   ],
      ["isauli",               [:kRETURN,   :kRETURN     ], :expr_mid   ],
      ["ibigay",               [:kRETURN,   :kRETURN     ], :expr_mid   ],
      ["magbigay",             [:kRETURN,   :kRETURN     ], :expr_mid   ],
      ["tama",                 [:kTRUE,     :kTRUE       ], :expr_end   ],
      ["kapag",                [:kIF,       :kIF_MOD     ], :expr_beg   ],
      ["kapag_ang",            [:kIF,       :kIF_MOD     ], :expr_beg   ],
      ["kapag_na_ang",         [:kIF,       :kIF_MOD     ], :expr_beg   ],
      ["kung",                 [:kIF,       :kIF_MOD     ], :expr_beg   ],
      ["kung_ang",             [:kIF,       :kIF_MOD     ], :expr_beg   ],
      ["nakatukoy?",           [:kDEFINED,  :kDEFINED    ], :expr_arg   ],
      ["nakasaad?",            [:kDEFINED,  :kDEFINED    ], :expr_arg   ],
      ["super",                [:kSUPER,    :kSUPER      ], :expr_arg   ],
      ["tanggalin",            [:kUNDEF,    :kUNDEF      ], :expr_fname ],
      ["magtanggal",           [:kUNDEF,    :kUNDEF      ], :expr_fname ],
      ["ihinto",               [:kBREAK,    :kBREAK      ], :expr_mid   ],
      ["sa",                   [:kIN,       :kIN         ], :expr_beg   ],
      ["sa_loob_ng",           [:kIN,       :kIN         ], :expr_beg   ],
      ["nasa",                 [:kIN,       :kIN         ], :expr_beg   ],
      ["na_nasa",              [:kIN,       :kIN         ], :expr_beg   ],
      ["na_ganito",            [:kDO,       :kDO         ], :expr_beg   ],
      ["nang_ganito",          [:kDO,       :kDO         ], :expr_beg   ],
      ["ganito",               [:kDO,       :kDO         ], :expr_beg   ],
      ["ganito_gawin",         [:kDO,       :kDO         ], :expr_beg   ],
      ["ganito_ang_gagawin",   [:kDO,       :kDO         ], :expr_beg   ],
      ["wala",                 [:kNIL,      :kNIL        ], :expr_end   ],
      ["hanggang",             [:kUNTIL,    :kUNTIL_MOD  ], :expr_beg   ],
      ["hanggang_ang",         [:kUNTIL,    :kUNTIL_MOD  ], :expr_beg   ],
      ["mapa_hanggang",        [:kUNTIL,    :kUNTIL_MOD  ], :expr_beg   ],
      ["malibang",             [:kUNLESS,   :kUNLESS_MOD ], :expr_beg   ],
      ["maliban_na",           [:kUNLESS,   :kUNLESS_MOD ], :expr_beg   ],
      ["maliban_ang",          [:kUNLESS,   :kUNLESS_MOD ], :expr_beg   ],
      ["o",                    [:kOR,       :kOR         ], :expr_beg   ],
      ["o_ang",                [:kOR,       :kOR         ], :expr_beg   ],
      ["sumunod",              [:kNEXT,     :kNEXT       ], :expr_mid   ],
      ["kasunod",              [:kNEXT,     :kNEXT       ], :expr_mid   ],
      ["pagka",                [:kWHEN,     :kWHEN       ], :expr_beg   ],
      ["pagka_ang",            [:kWHEN,     :kWHEN       ], :expr_beg   ],
      ["ay",                   [:kWHEN,     :kWHEN       ], :expr_beg   ],
      ["ulitin",               [:kREDO,     :kREDO       ], :expr_end   ],
      ["at_ulitin",            [:kREDO,     :kREDO       ], :expr_end   ],
      ["uliting_muli",         [:kREDO,     :kREDO       ], :expr_end   ],
      ["at",                   [:kAND,      :kAND        ], :expr_beg   ],
      ["at_ang",               [:kAND,      :kAND        ], :expr_beg   ],
      ["simula",               [:kBEGIN,    :kBEGIN      ], :expr_beg   ],
      ["simulan",              [:kBEGIN,    :kBEGIN      ], :expr_beg   ],
      ["__LINE__",             [:k__LINE__, :k__LINE__   ], :expr_end   ],
      ["klase",                [:kCLASS,    :kCLASS      ], :expr_class ],
      ["__FILE__",             [:k__FILE__, :k__FILE__   ], :expr_end   ],
      ["END",                  [:klEND,     :klEND       ], :expr_end   ],
      ["BEGIN",                [:klBEGIN,   :klBEGIN     ], :expr_end   ],
      ["habang",               [:kWHILE,    :kWHILE_MOD  ], :expr_beg   ],
      ["habang_ang",           [:kWHILE,    :kWHILE_MOD  ], :expr_beg   ],
      ["alyas",                [:kALIAS,    :kALIAS      ], :expr_fname ],
      ["__ENCODING__",         [:k__ENCODING__, :k__ENCODING__], :expr_end],
    ].map { |args| KWtable.new(*args) }

    # :startdoc:

    original_verbosity = $VERBOSE
    $VERBOSE = nil

    WORDLIST18 = Hash[*wordlist.map { |o| [o.name, o] }.flatten]
    WORDLIST19 = Hash[*wordlist.map { |o| [o.name, o] }.flatten]

    $VERBOSE = original_verbosity

    WORDLIST18.delete "__ENCODING__"

    %w[at at_ang
      kalagayan kaukulan sakaling sakali kung_sakaling sakali_na kung_sakali_na
      ngunit_kapag kung_kapag ngunit_kapag_ang kung_kapag_ang
      para_sa para_ang
      kapag kapag_ang kapag_na_ang kung kung_ang
      sa sa_loob_ng nasa na_nasa
      modyul
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

