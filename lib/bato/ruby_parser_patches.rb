# frozen_string_literal: true

module RubyParserStuff
  class Keyword
    pang_kapahayagang_mga_salita = [
      ['katapusan',            %i[kEND kEND],                   EXPR_END],
      ['dulo',                 %i[kEND kEND],                   EXPR_END],
      ['wakas',                %i[kEND kEND],                   EXPR_END],
      ['ang',                  %i[kDEF kDEF],                   EXPR_FNAME],
      ['panuntunang',          %i[kDEF kDEF],                   EXPR_FNAME],
      ['panuntunan',           %i[kDEF kDEF],                   EXPR_FNAME],
      ['iligtas',              %i[kRESCUE kRESCUE_MOD],         EXPR_MID],
      ['agapan',               %i[kRESCUE kRESCUE_MOD],         EXPR_MID],
      ['bigyang_daan',         %i[kYIELD kYIELD],               EXPR_ARG],
      ['magbigay_daan',        %i[kYIELD kYIELD],               EXPR_ARG],
      ['sariling',             %i[kSELF kSELF],                 EXPR_END],
      ['sarili',               %i[kSELF kSELF],                 EXPR_END],
      ['mali',                 %i[kFALSE kFALSE],               EXPR_END],
      ['subukang_muli',        %i[kRETRY kRETRY],               EXPR_END],
      ['ibalik',               %i[kRETURN kRETURN],             EXPR_MID],
      ['ibalik_ang',           %i[kRETURN kRETURN],             EXPR_MID],
      ['magbalik',             %i[kRETURN kRETURN],             EXPR_MID],
      ['magbalik_nang',        %i[kRETURN kRETURN],             EXPR_MID],
      ['isauli',               %i[kRETURN kRETURN],             EXPR_MID],
      ['isauli_ang',           %i[kRETURN kRETURN],             EXPR_MID],
      ['ibigay',               %i[kRETURN kRETURN],             EXPR_MID],
      ['ibigay_ang',           %i[kRETURN kRETURN],             EXPR_MID],
      ['magbigay',             %i[kRETURN kRETURN],             EXPR_MID],
      ['magbigay_nang',        %i[kRETURN kRETURN],             EXPR_MID],
      ['tama',                 %i[kTRUE kTRUE],                 EXPR_END],
      ['totoo',                %i[kTRUE kTRUE],                 EXPR_END],
      ['tunay',                %i[kTRUE kTRUE],                 EXPR_END],
      ['katotohanan',          %i[kTRUE kTRUE],                 EXPR_END],
      ['nakatukoy?',           %i[kDEFINED kDEFINED],           EXPR_ARG],
      ['nakasaad?',            %i[kDEFINED kDEFINED],           EXPR_ARG],
      ['tanggalin',            %i[kUNDEF kUNDEF],               EXPR_FNAME|EXPR_FITEM],
      ['magtanggal',           %i[kUNDEF kUNDEF],               EXPR_FNAME|EXPR_FITEM],
      ['ihinto',               %i[kBREAK kBREAK],               EXPR_MID],
      ['hinto',                %i[kBREAK kBREAK],               EXPR_MID],
      ['wala',                 %i[kNIL kNIL],                   EXPR_END],
      ['sumunod',              %i[kNEXT kNEXT],                 EXPR_MID],
      ['kasunod',              %i[kNEXT kNEXT],                 EXPR_MID],
      ['ulitin',               %i[kREDO kREDO],                 EXPR_END],
      ['at_ulitin',            %i[kREDO kREDO],                 EXPR_END],
      ['uliting_muli',         %i[kREDO kREDO],                 EXPR_END],
      ['bilang',               %i[kCLASS kCLASS],               EXPR_CLASS],
      ['klase',                %i[kCLASS kCLASS],               EXPR_CLASS],
      ['alyas',                %i[kALIAS kALIAS],               EXPR_FNAME|EXPR_FITEM],
      ['iba',                  %i[kELSE kELSE],                 EXPR_BEG],
      ['kung_iba',             %i[kELSE kELSE],                 EXPR_BEG],
      ['kung_hindi_naman',     %i[kELSE kELSE],                 EXPR_BEG],
      ['kapag_hindi',          %i[kELSE kELSE],                 EXPR_BEG],
      ['kapag_hindi_naman',    %i[kELSE kELSE],                 EXPR_BEG],
      ['kung_hindi_pa',        %i[kELSE kELSE],                 EXPR_BEG],
      ['kapag_hindi_pa',       %i[kELSE kELSE],                 EXPR_BEG],
      ['at_kung_hindi',        %i[kELSE kELSE],                 EXPR_BEG],
      ['at_kapag_hindi',       %i[kELSE kELSE],                 EXPR_BEG],
      ['at_kung_hindi_naman',  %i[kELSE kELSE],                 EXPR_BEG],
      ['at_kapag_hindi_naman', %i[kELSE kELSE],                 EXPR_BEG],
      ['at_kung_hindi_pa',     %i[kELSE kELSE],                 EXPR_BEG],
      ['at_kapag_hindi_pa',    %i[kELSE kELSE],                 EXPR_BEG],
      ['maliban_dito',         %i[kELSE kELSE],                 EXPR_BEG],
      ['maliban_sa_mga_ito',   %i[kELSE kELSE],                 EXPR_BEG],
      ['matiyak',              %i[kENSURE kENSURE],             EXPR_BEG],
      ['tiyakin',              %i[kENSURE kENSURE],             EXPR_BEG],
      ['tiyaking',             %i[kENSURE kENSURE],             EXPR_BEG],
      ['siguraduhing',         %i[kENSURE kENSURE],             EXPR_BEG],
      ['siguraduhin',          %i[kENSURE kENSURE],             EXPR_BEG],
      ['panigurado',           %i[kENSURE kENSURE],             EXPR_BEG],
      ['kung_hindi',           %i[kELSE kELSE],                 EXPR_BEG],
      ['dapat',                %i[kTHEN kTHEN],                 EXPR_BEG],
      ['na_ganito',            %i[kDO kDO],                     EXPR_BEG],
      ['nang_ganito',          %i[kDO kDO],                     EXPR_BEG],
      ['ng_ganito',            %i[kDO kDO],                     EXPR_BEG],
      ['ganito',               %i[kDO kDO],                     EXPR_BEG],
      ['ganito_gawin',         %i[kDO kDO],                     EXPR_BEG],
      ['ganito_ang_gagawin',   %i[kDO kDO],                     EXPR_BEG],
      ['simula',               %i[kBEGIN kBEGIN],               EXPR_BEG],
      ['simulan',              %i[kBEGIN kBEGIN],               EXPR_BEG]
    ]

    pang_ekspresyon_na_mga_salita = [
      ['at',                   %i[kAND kAND],                   EXPR_BEG],
      ['at_ang',               %i[kAND kAND],                   EXPR_BEG],
      ['kalagayan',            %i[kCASE kCASE],                 EXPR_BEG],
      ['kaukulan',             %i[kCASE kCASE],                 EXPR_BEG],
      ['sakaling',             %i[kCASE kCASE],                 EXPR_BEG],
      ['sakali',               %i[kCASE kCASE],                 EXPR_BEG],
      ['kung_sakaling',        %i[kCASE kCASE],                 EXPR_BEG],
      ['sakali_na',            %i[kCASE kCASE],                 EXPR_BEG],
      ['kung_sakali_na',       %i[kCASE kCASE],                 EXPR_BEG],
      ['ngunit_kapag',         %i[kELSIF kELSIF],               EXPR_BEG],
      ['kung_kapag',           %i[kELSIF kELSIF],               EXPR_BEG],
      ['ngunit_kapag_ang',     %i[kELSIF kELSIF],               EXPR_BEG],
      ['kung_kapag_ang',       %i[kELSIF kELSIF],               EXPR_BEG],
      ['para_sa',              %i[kFOR kFOR],                   EXPR_BEG],
      ['para_ang',             %i[kFOR kFOR],                   EXPR_BEG],
      ['kapag',                %i[kIF kIF_MOD],                 EXPR_BEG],
      ['kapag_ang',            %i[kIF kIF_MOD],                 EXPR_BEG],
      ['kapag_na_ang',         %i[kIF kIF_MOD],                 EXPR_BEG],
      ['kung',                 %i[kIF kIF_MOD],                 EXPR_BEG],
      ['kung_ang',             %i[kIF kIF_MOD],                 EXPR_BEG],
      ['sa',                   %i[kIN kIN],                     EXPR_BEG],
      ['sa_loob_ng',           %i[kIN kIN],                     EXPR_BEG],
      ['nasa',                 %i[kIN kIN],                     EXPR_BEG],
      ['na_nasa',              %i[kIN kIN],                     EXPR_BEG],
      ['modyul',               %i[kMODULE kMODULE],             EXPR_BEG],
      ['grupo',                %i[kMODULE kMODULE],             EXPR_BEG],
      ['o',                    %i[kOR kOR],                     EXPR_BEG],
      ['o_ang',                %i[kOR kOR],                     EXPR_BEG],
      ['malibang',             %i[kUNLESS kUNLESS_MOD],         EXPR_BEG],
      ['maliban_na',           %i[kUNLESS kUNLESS_MOD],         EXPR_BEG],
      ['maliban_ang',          %i[kUNLESS kUNLESS_MOD],         EXPR_BEG],
      ['hanggang',             %i[kUNTIL kUNTIL_MOD],           EXPR_BEG],
      ['hanggang_ang',         %i[kUNTIL kUNTIL_MOD],           EXPR_BEG],
      ['mapa_hanggang',        %i[kUNTIL kUNTIL_MOD],           EXPR_BEG],
      ['pagka',                %i[kWHEN kWHEN],                 EXPR_BEG],
      ['pagka_ang',            %i[kWHEN kWHEN],                 EXPR_BEG],
      ['ay',                   %i[kWHEN kWHEN],                 EXPR_BEG],
      ['habang',               %i[kWHILE kWHILE_MOD],           EXPR_BEG],
      ['habang_ang',           %i[kWHILE kWHILE_MOD],           EXPR_BEG]
    ]

    pang_internal_na_mekanismo_na_mga_salita = [
      ['END',                  %i[klEND klEND],                 EXPR_END],
      ['BEGIN',                %i[klBEGIN klBEGIN],             EXPR_END],
      ['super',                %i[kSUPER kSUPER],               EXPR_ARG],
      ['__FILE__',             %i[k__FILE__ k__FILE__],         EXPR_END],
      ['__LINE__',             %i[k__LINE__ k__LINE__],         EXPR_END],
      ['__ENCODING__',         %i[k__ENCODING__ k__ENCODING__], EXPR_END]
    ]

    pang_argumentong_mga_salita = [
      ['hindi',                %i[kNOT kNOT],                   EXPR_BEG]
    ]

    orihinal_na_pagkakasabi = $VERBOSE
    $VERBOSE = nil

    mga_salita = [
      pang_kapahayagang_mga_salita,
      pang_ekspresyon_na_mga_salita,
      pang_internal_na_mekanismo_na_mga_salita,
      pang_argumentong_mga_salita
    ].flatten(1).map { |args| KWtable.new(*args) }

    WORDLIST = Hash[*mga_salita.map { |o| [o.name, o] }.flatten]

    $VERBOSE = orihinal_na_pagkakasabi
  end
end
