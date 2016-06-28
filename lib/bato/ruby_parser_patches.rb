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
      ["katapusan",       [:kEND,      :kEND        ], :expr_end   ],
      ["kung_hindi",      [:kELSE,     :kELSE       ], :expr_beg   ],
      ["kung_sakaling",   [:kCASE,     :kCASE       ], :expr_beg   ],
      ["siguraduhing",    [:kENSURE,   :kENSURE     ], :expr_beg   ],
      ["module",          [:kMODULE,   :kMODULE     ], :expr_beg   ],
      ["ngunit_kapag",    [:kELSIF,    :kELSIF      ], :expr_beg   ],
      ["kung_kapag",      [:kELSIF,    :kELSIF      ], :expr_beg   ],
      ["def",             [:kDEF,      :kDEF        ], :expr_fname ],
      ["iligtas",         [:kRESCUE,   :kRESCUE_MOD ], :expr_mid   ],
      ["hindi",           [:kNOT,      :kNOT        ], :expr_beg   ],
      ["dapat",           [:kTHEN,     :kTHEN       ], :expr_beg   ],
      ["yield",           [:kYIELD,    :kYIELD      ], :expr_arg   ],
      ["for",             [:kFOR,      :kFOR        ], :expr_beg   ],
      ["self",            [:kSELF,     :kSELF       ], :expr_end   ],
      ["mali",            [:kFALSE,    :kFALSE      ], :expr_end   ],
      ["subukang_muli",   [:kRETRY,    :kRETRY      ], :expr_end   ],
      ["return",          [:kRETURN,   :kRETURN     ], :expr_mid   ],
      ["tama",            [:kTRUE,     :kTRUE       ], :expr_end   ],
      ["kapag",           [:kIF,       :kIF_MOD     ], :expr_beg   ],
      ["defined?",        [:kDEFINED,  :kDEFINED    ], :expr_arg   ],
      ["super",           [:kSUPER,    :kSUPER      ], :expr_arg   ],
      ["undef",           [:kUNDEF,    :kUNDEF      ], :expr_fname ],
      ["break",           [:kBREAK,    :kBREAK      ], :expr_mid   ],
      ["in",              [:kIN,       :kIN         ], :expr_beg   ],
      ["do",              [:kDO,       :kDO         ], :expr_beg   ],
      ["nil",             [:kNIL,      :kNIL        ], :expr_end   ],
      ["until",           [:kUNTIL,    :kUNTIL_MOD  ], :expr_beg   ],
      ["unless",          [:kUNLESS,   :kUNLESS_MOD ], :expr_beg   ],
      ["or",              [:kOR,       :kOR         ], :expr_beg   ],
      ["next",            [:kNEXT,     :kNEXT       ], :expr_mid   ],
      ["pagka",           [:kWHEN,     :kWHEN       ], :expr_beg   ],
      ["redo",            [:kREDO,     :kREDO       ], :expr_end   ],
      ["and",             [:kAND,      :kAND        ], :expr_beg   ],
      ["simula",          [:kBEGIN,    :kBEGIN      ], :expr_beg   ],
      ["__LINE__",        [:k__LINE__, :k__LINE__   ], :expr_end   ],
      ["class",           [:kCLASS,    :kCLASS      ], :expr_class ],
      ["__FILE__",        [:k__FILE__, :k__FILE__   ], :expr_end   ],
      ["END",             [:klEND,     :klEND       ], :expr_end   ],
      ["BEGIN",           [:klBEGIN,   :klBEGIN     ], :expr_end   ],
      ["while",           [:kWHILE,    :kWHILE_MOD  ], :expr_beg   ],
      ["alias",           [:kALIAS,    :kALIAS      ], :expr_fname ],
      ["__ENCODING__",    [:k__ENCODING__, :k__ENCODING__], :expr_end],
    ].map { |args| KWtable.new(*args) }

    # :startdoc:

    original_verbosity = $VERBOSE
    $VERBOSE = nil

    WORDLIST18 = Hash[*wordlist.map { |o| [o.name, o] }.flatten]
    WORDLIST19 = Hash[*wordlist.map { |o| [o.name, o] }.flatten]

    $VERBOSE = original_verbosity

    WORDLIST18.delete "__ENCODING__"

    %w[and kung_sakaling ngunit_kapag kung_kapag for kapag in module or unless until pagka while].each do |k|
      WORDLIST19[k] = WORDLIST19[k].dup
      WORDLIST19[k].state = :expr_value
    end
    %w[hindi].each do |k|
      WORDLIST19[k] = WORDLIST19[k].dup
      WORDLIST19[k].state = :expr_arg
    end

  end
end

