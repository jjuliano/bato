# Bato

Ang 'Bato' ay ang unang programming language sa wikang Filipino.

## Pagtatalaga

Kailangan mo munang i-install ang Ruby programming language (version 1.9.3 o mas bago)
at pagkatapos maitalaga ang Ruby, i-run naman ito

    gem install bato

## Bakit Bato?

Ang 'bato' ay hango sa [Ruby Programming Language](http://www.ruby-lang.org/) na may Filipino sintaks.
Ang kadahilanang ginamit ang pangalang 'bato' ay dahil ang Ruby ay isang uri ng bato.

## Ang unang program

Gumawa ng isang file na kamusta_mundo.bato na may mga sumusunod na nilalaman

    kapag 1 > 0
      iprint "Kumusta mundo!"
    kung_hindi
      iprint "Mayroong sira"
    wakas

at pa-andarin ang program sa pamamagitan ng

    bato kamusta_mundo.bato

## Sintaks

### Pagsusulat

    "Ito ay mga serye ng mga sulat sa wikang Filipino"
    <<-KATAPUSAN
      mga salita
      na nahahati
      sa ilang mga hilera
    KATAPUSAN

### Dinikit na mga pamamaraan
    'magandang araw'.baliktad         # => 'wara gnadnagam'
    'Pangungusap'.haba                # => 11

### Ekspresyong Boolean

    tama
    mali
    hindi tama

### Kondisyon

Paggamit ng kondisyon.

    kapag halaga > 100 dapat
      "ayos lang"
    kung_kapag halaga > 0 dapat
      "ok lang"
    kung_hindi
      "wala lang"
    wakas

    kung_sakaling halaga
    pagka 5 dapat "lima"
    pagka 4 dapat "apat"
    kung_hindi "wala"
    wakas

### Pamamaraan sa pagkakamali

    bilang_ng_pagkakamali = 0
    simula
      # mag komento kapag hindi sigurado
      1 / 0
    iligtas => pagkakamali
      bilang_ng_pagkakamali += 1
      subukang_muli kapag bilang_ng_pagkakamali < 3
      iangat "malubhang pagkakamali"
    siguraduhing
      iprint "Tapos na"
    wakas

### Panuntunan

    ang iprintAngPangalan(pangalan = wala)
      kapag pangalan != wala
        iprint "Magandang araw sa iyo #{pangalan}!"
      kung_hindi
        iprint "Magandang araw!"
      wakas
    wakas

    iprintAngPangalan "Maria" # => "Magandang araw sa iyo Maria!"
    iprintAngPangalan         # => "Magandang araw!"

## Paggamit ng mga ekspresyon ng mga salita sa program

### wakas

Maari kang gumamit sa alin sa mga sumusunod sa pagtatapos ng program

    wakas
    dulo
    katapusan

Sampol

    bilang = 0
    kapag bilang > 1
      iprint "Mayroon ng laman ang bilang na #{bilang}"
    kung_hindi
      iprint "Wala pang laman ang bilang"
    wakas

###  kung_iba

Kapag ang ekspresyon ay hindi nasunod maaring gumamit sa alin sa mga sumusunod

    iba
    kung_iba
    kung_hindi
    kung_hindi_naman
    kapag_hindi
    kapag_hindi_naman
    kung_hindi_pa
    kapag_hindi_pa
    at_kung_hindi
    at_kapag_hindi
    at_kung_hindi_naman
    at_kapag_hindi_naman
    at_kapag_hindi_pa
    at_kung_hindi_pa
    maliban_dito
    maliban_sa_mga_ito

Sampol

    pangalan_mo = "Maliksi"
    kapag_ang pangalan_mo == "Maliksi"
      iprint "Ikaw ay si #{pangalan_mo}!"
    kung_hindi_naman
      iprint "Magandang araw sa iyo #{pangalan_mo}!"
    wakas

### sakali

Kapag mayroon kang ekspresyon na madaming resulta gawa ng mga iba't ibang kondisyon, maari kang gumamit ng mga sumusunod

    sakaling
    sakali
    kung_sakaling
    sakali_na
    kung_sakali_na
    kalagayan
    kaukulan

Sampol

    pangalan_mo = "Mabait"

    sakaling pangalan_mo
    ay "Maliksi"
      iprint "Ikaw ay si Maliksi!"
    ay "Matipuno"
      iprint "Ikaw ay si Matipuno!"
    ay "Mabait"
      iprint "Ikaw ay si Mabait!"
    maliban_dito
      iprint "Magandang araw sa iyo!"
    wakas

### tiyakin

Kung mayroon kang ekspresyon na gusto mong masunod kahit ano pa ang kahihinatnan nito, gumamit ng mga sumusunod

    tiyaking
    matiyak
    tiyakin
    siguraduhing
    siguraduhin
    panigurado

Sampol

    simulan
      itaas "May sira!"
    agapan
      iprint "Ipagpatuloy..."
      itaas "May nasira na na-agapan"
    tiyaking
      iprint "Tapos na"
    wakas

### grupo

Ang grupo ay ang lalagyanan ng mga kabilang na klase sa iyong program

    grupo

Sampol

    grupo Hayop
      KABUUAN = 5

      bilang Aso
        ang tahol
          iprint "Woof..."
        wakas

        ang kumanin
          iprint "..."
        wakas

        ang ikembot_ang_buntot
          iprint "Ginagawa ko ito dahil masaya ako!"
        wakas
      wakas
    wakas

    dami = 6
    browny = Hayop::Aso.kumatawan
    browny.ikembot_ang_buntot kapag dami >= Hayop::KABUUAN

### ngunit_kapag

Gumamit ng ngunit_kapag kapag mayroon ka pang kondisyon maliban sa nauna ng kondisyon

    ngunit_kapag
    kung_kapag
    ngunit_kapag_ang
    kung_kapag_ang

Sampol

    pangalan_mo = "Masipag"
    kapag_ang pangalan_mo == "Matipuno"
      iprint "Ikaw ay si Matipuno!"
    ngunit_kapag_ang pangalan_mo == "Masipag"
      iprint "Ikaw ay si Masipag!"
    maliban_sa_mga_ito
      iprint "Wala kang rekord saamin!"
    wakas

### ang

Ang ang ay may kalakip na pangalan upang ito ay matawag sa program

    ang
    panuntunan
    panuntunang

Sampol

    ang id(estudyante = {})
      pangalan = estudyante[:pangalan]
      edad     = estudyante[:edad]
      tirahan  = estudyante[:tirahan]
      baitang  = estudyante[:baitang]
      seksiyon = estudyante[:seksiyon]

      iprint <<-KATAPUSAN
        Pangalan: #{pangalan}
        Edad:     #{edad}
        Tirahan:  #{tirahan}
        Baitang:  #{baitang}
        Seksiyon: #{seksiyon}
      KATAPUSAN
    wakas

    id({
      pangalan: "Maliksi Batubalani",
      edad: "13",
      tirahan: "Ilocos",
      baitang: "6",
      seksiyon: "Masisipag"
    })

### agapan

Ang agapan ay ginagamit kung mayroon maaaring mangyaring pagkakamali na gusto mong maisalba o mailigtas

    iligtas
    agapan

Sampol

    simulan
      1 / 0
    agapan
      iprint "Hindi ito posible!"
    wakas

### dapat

Kapag mayroon kang ekspresyon na mayroong inaasahan na resulta, gumamit ng dapat

    dapat

Sampol

    panulat_mo = "lapis"

    papel = sakaling panulat_mo
      ay "lapis" dapat "bond paper"
      ay "ballpen" dapat "dilaw na papel"
      maliban_sa_mga_ito "intermediate paper"
    wakas

    iprint "Ang papel na gagamitin mo ay #{papel}"

### magbigay_daan

Kapag ang ekspresyon ay mayroong inaasahang dapat na ibigay na resulta habang gumagana pa ang program, gumamit ng magbigay_daan

    magbigay_daan
    bigyang_daan

Sampol

    ang gumawaNgID
      iprint "------------------------------------------"
      magbigay_daan
      iprint "------------------------------------------"
    wakas

    ang ID(impormasyon = {})
      gumawaNgID na_ganito
        iprint <<-KATAPUSAN
          Pangalan: #{impormasyon[:pangalan]}
          Edad:     #{impormasyon[:edad]}
          Tirahan:  #{impormasyon[:tirahan]}
          Baitang:  #{impormasyon[:baitang]}
          Seksiyon: #{impormasyon[:seksiyon]}
        KATAPUSAN
      wakas
    wakas

    ID({
      pangalan: "Maliksi Batubalani",
      edad: "13",
      tirahan: "Ilocos",
      baitang: "6",
      seksiyon: "Masisipag"
    })

### para_sa

Kapag may listahan na nais mong isa isahin, gumamit ng para_sa

    para_sa
    para_ang

Sampol

    listahan_ng_mga_prutas = ["mansanas", "mangga", "guava", "santol", "ubas"]
    para_sa prutas na_nasa listahan_ng_mga_prutas ganito_gawin
      iprint prutas.sa_malaking_titik
    wakas

### subukang_muli

Ginagamit ang subukang_muli upang umikot muli ang ekspresyon kung may sirang nangyari at nais mo ulit subukan pa andarin

    subukang_muli

Sampol

    bilang_ng_pagkakamali = 0
    simula
      1 / 0
    agapan => pagkakamali
      bilang_ng_pagkakamali += 1
      subukang_muli kapag bilang_ng_pagkakamali < 3
      iangat "malubhang pagkakamali"
    siguraduhing
      iprint "Tapos na"
    wakas

### ibalik

Kapag mayroon kang ibabalik na resulta sa nagtawag ng ang

    ibalik
    ibalik_ang
    magbalik
    magbalik_nang
    isauli
    isauli_ang
    ibigay
    ibigay_ang
    magbigay
    magbigay_nang

Sampol

    ang magdagdag_ng_isa(halaga)
      idadagdag = halaga + 1
      ibalik_ang halaga
    wakas

### kapag

Ginagamit ang kapag kung meron kang kondisyon sa iyong ekspresyon

    kapag
    kapag_ang
    kapag_na_ang
    kung
    kung_ang

Sampol

    kapag_ang 1 > 0
      iprint "mas madami!"
    kung_iba
      iprint "may sira"
    wakas

### bilang

Ang bilang ay ang pagsasabilang ng isang kaukulang klasipikasyon

    bilang

Sampol

    grupo Tinapay
      bilang Donut
        ang flavor
          iprint 'Strawberry!'
        wakas
      wakas
    wakas

    tinapay = Tinapay::Donut.kumatawan
    tinapay.flavor
    => 'Strawberry!'

### habang

Gumamit ng habang kung may hinihintay pa na resulta, kondisyon o pangyayari

    habang
    habang_ang

Sampol

    may_buhay = totoo

    habang may_buhay
      iprint 'may pag-asa!'
      hinto
    wakas
    => 'may pag-asa!'

### alyas

Gumamit ng alyas kung kailangan mo tawagin sa ibang pangalan ang iyong panuntunan

    alyas

Sampol

    bilang Hayop
      ang aso
        iprint 'si browny ay mabait!'
      wakas
      alyas browny aso
    wakas

    hayop = Hayop.kumatawan
    hayop.browny
    => 'si browny ay mabait!'

### nakatukoy?

Ang nakatukoy? ay ginagamit kung kailangan malaman kung umiiral ang isang grupo o klase.

    nakatukoy?
    nakasaad?

Sampol

    grupo Manggagawa
      bilang Magsasaka
        ang pananim
          ['sibuyas', 'kamatis', 'sili', 'palay', 'mais'].isaisahin na_ganito |pananim|
            iprint "Mag tatanim ng #{pananim} ngayong panahon"
          wakas
        wakas
      wakas
    wakas

    kung nakatukoy?(Manggagawa::Magsasaka)
      iprint 'May nakatukoy!'
    wakas

### tanggalin

Ginagamit ang tanggalin kung may tatanggaling panuntunan sa isang klase

    tanggalin
    magtanggal

Sampol

    grupo Hayop
      bilang Aso
        ang tahol
          iprint 'baw waw!'
        wakas
      wakas
    wakas

    bilang Pusa < Hayop::Aso
      tanggalin tahol
      ang meow
        iprint 'meow wahu!'
      wakas
    wakas

    pusa = Pusa.kumatawan

    simulan
      pusa.tahol
    agapan => pagkakamali
      iprint "ang pagkakamali ay '#{pagkakamali}'"
    wakas

### ihinto

Gumamit ng 'hinto' kung may nais kang matapos na kondisyon gamit ang 'habang'

    ihinto
    hinto

Sampol

    nakamit = mali

    habang nakamit == mali
      iprint 'hindi pa nakakamit!'
      hinto
    wakas

    iprint 'nakamit na!'

### sa

Ginagamit ang 'sa' kung nais mong matukoy ang kasulukuyang listahan

    sa
    sa_loob_ng
    nasa
    na_nasa

Sampol

  Tignan ang [para_sa](#para_sa)

### ganito

Ginagamit ang 'ganito' kung nais mong i konteksto ang kasulukuyang listahan

    na_ganito
    nang_ganito
    ganito

Sampol

  Tignan ang [magbigay_daan](#magbigay_daan), [nakatukoy?](#nakatukoy?)

### hanggang

Ang 'hanggang' ay magpapatuloy tumakbo hanggang maabot ang tamang kundisyon.

    hanggang
    hanggang_ang
    mapa_hanggang

Sampol

		numero = 0
		panghuling_numero = 5
		simula
		  iprint "Ang numero ay #{numero} na"
		  numero += 1
		wakas hanggang numero < panghuling_numero

### maliban_na

    malibang
    maliban_na
    maliban_ang

Sampol

    mga_persona = [
      { pangalan: 'Gener', kasarian: 'lalaki' },
      { pangalan: 'Karmen', kasarian: 'babae' }
    ]

    mga_persona.isaisahin ng_ganito |tao|
      malibang tao[:kasarian] == 'lalaki'
        iprint "si #{tao[:pangalan]} ay babae!"
      maliban_dito
        iprint "si #{tao[:pangalan]} ay lalaki!"
      wakas
    wakas

### o

Ang 'o' ay ginagamit upang piliin ang nagsasauli ng tama.

    o
    o_ang

Sampol

    totoo o mali
    => totoo

## Pagtulong sa pagdedevelop ng Bato

Magpadala ng mga kahilingan sa paggawa ng ticket.

## Lisensya

Instituto Ng Tekonolohiya sa Massachusetts License (makikita sa LICENSE.txt na file).
