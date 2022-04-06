# Bato

Ang **Bato Programming Language** ay isang scripting language sa wikang
*Filipino*.

Ang layunin ng proyektong ito ay upang mag turo ng *Computer Programming* sa
wikang *Filipino*, sa madaling maintindihang wika upang matutuhan ito.

Subukan ang [Bato *interactive online console*](https://trybato.herokuapp.com/).

## Media

* Yukihiro Matzumoto (Chief Designer of Ruby) - https://twitter.com/yukihiro_matz/status/962193256929832960
* The Register - https://www.theregister.co.uk/2018/03/21/philippines_ruby_bato
* Speed Magazine - https://www.speedmagazine.ph/bato-tagalog-programming-language-by-joel-bryan-juliano/
* University of the Philippines (UPLB Mathematical Sciences Society) - https://twitter.com/uplbmass1973/status/1429684834511716355
* De La Salle University (Access DLSU) - https://www.facebook.com/AccessDLSU/posts/1666465890181933
* San Beda University (BITS San Beda) - https://www.facebook.com/BITSSanBeda/photos/a.476052709434852/1391553414551439
* Philippine Web Design Organization (Form Function Class) - https://twitter.com/ffcph/status/1015212784089534464
* FullStack HQ - https://twitter.com/fullstackhq/status/1429035930640388106
* Programmer Ako - https://www.facebook.com/ProgrammerLang/posts/808487952978981
* Algo Filipino - https://www.facebook.com/AlgoFilipino/posts/149472316929258
* Binalatongan Community College (BITS) - https://www.facebook.com/BinalatonganCommunityCollegeBITS/posts/207649374632071
* Philippine Insider TV (YouTube) - https://www.facebook.com/philippineinsidertv/posts/186868113430790
* Jeck's Tech Nook - https://www.facebook.com/jeck.tech.nook/posts/442902100786391
* YCombinator Hacker News - https://twitter.com/hnbot/status/951816054161977344

## Pagtatalaga

Kailangan mo munang *i-install* ang Ruby programming language (version 3.0.1 o mas
bago) at pagkatapos maitalaga ang Ruby, *i-run* naman ito

```shell
gem install bato
```

## Bakit Bato?

Ang **bato** ay hango sa [Ruby Programming Language](http://www.ruby-lang.org/)
na may *Filipino* sintaks. Ang kadahilanang ginamit ang pangalang 'bato' ay
dahil ang Ruby ay isang uri ng bato.

## Ang unang program

Gumawa ng isang file na `kamusta_mundo.bt` na may mga sumusunod na nilalaman

```ruby
kapag 1 > 0
  mag_print "Kumusta mundo!"
kung_hindi
  mag_print "Mayroong sira"
wakas
```

at pa-andarin ang program sa pamamagitan ng

```shell
bato kamusta_mundo.bt
```

## Sintaks

### Pagsusulat

```ruby
"Ito ay mga serye ng mga sulat sa wikang Filipino"
<<-KATAPUSAN
  mga salita
  na nahahati
  sa ilang mga hilera
KATAPUSAN
```

### Dinikit na mga pamamaraan

```ruby
'magandang araw'.baliktad         # => 'wara gnadnagam'
'Pangungusap'.haba                # => 11
```

### Ekspresyong Boolean

```ruby
tama
mali
hindi tama
```

### Kondisyon

Paggamit ng kondisyon.


```ruby
halaga = 100

mensahe = kapag halaga > 100 dapat
 "ayos lang"
kung_kapag halaga > 0 dapat
 "ok lang"
kung_hindi
 "wala lang"
wakas

mag_print mensahe

mensahe = 
  kung_sakaling halaga
  pagka 5 dapat "lima"
  pagka 4 dapat "apat"
  kung_hindi "wala"
  wakas

mag_print mensahe
```

### Pamamaraan sa pagkakamali

NOTE: Hindi ito gagana sa online compiler, ngunit sa pag *i-install* lang sa
iyon computer. Tignan ang seksiyon na [Pagtatalaga](#Pagtatalaga)

```ruby
bilang_ng_pagkakamali = 0
simula
  # mag komento kapag hindi sigurado
  1 / 0
iligtas => pagkakamali
  bilang_ng_pagkakamali += 1
  subukang_muli kapag bilang_ng_pagkakamali < 3
  iangat "malubhang pagkakamali"
siguraduhing
  mag_print "Tapos na"
wakas
```

### Panuntunan

```ruby
ang iprintAngPangalan(pangalan = wala)
  mensahe =
    kapag pangalan != wala
      "Magandang araw sa iyo #{pangalan}!"
    kung_hindi
      "Magandang araw!"
    wakas
  
  mag_print mensahe
wakas

iprintAngPangalan "Maria" # => "Magandang araw sa iyo Maria!"
iprintAngPangalan         # => "Magandang araw!"
```

## Paggamit ng mga ekspresyon ng mga salita sa program

### wakas

Maari kang gumamit sa alin sa mga sumusunod sa pagtatapos ng program

```ruby
wakas
dulo
katapusan
```
Halimbawa

```ruby
bilang_ng_saging = 2

mensahe =
  kapag bilang_ng_saging > 1
    "Mayroon akong #{bilang_ng_saging} saging! 🍌"
  kung_hindi
    "Wala na akong saging! 😐"
  wakas

mag_print mensahe
```
###  kung_iba

Kapag ang ekspresyon ay hindi nasunod maaring gumamit sa alin sa mga sumusunod

```ruby
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
```

Halimbawa

```ruby
pangalan_mo = "Maliksi"

mensahe =
  kapag_ang pangalan_mo == "Maliksi"
    "Ikaw ay si #{pangalan_mo}!"
  kung_hindi_naman
    "Magandang araw sa iyo #{pangalan_mo}!"
  wakas

mag_print mensahe
```
### sakali

Kapag mayroon kang ekspresyon na madaming resulta gawa ng mga iba't ibang
kondisyon, maari kang gumamit ng mga sumusunod

```ruby
sakaling
sakali
kung_sakaling
sakali_na
kung_sakali_na
kalagayan
kaukulan
```

Halimbawa

```ruby
pangalan_mo = "Mabait"

mensahe =
  sakaling pangalan_mo
  ay "Maliksi"
    "Ikaw ay si Maliksi!"
  ay "Matipuno"
    "Ikaw ay si Matipuno!"
  ay "Mabait"
    "Ikaw ay si Mabait!"
  maliban_dito
    "Magandang araw sa iyo!"
  wakas

mag_print mensahe
```
### tiyakin

Kung mayroon kang ekspresyon na gusto mong masunod kahit ano pa ang kahihinatnan
nito, gumamit ng mga sumusunod

NOTE: Hindi ito gagana sa online compiler, ngunit sa pag *i-install* lang sa
iyon computer. Tignan ang seksiyon na [Pagtatalaga](#Pagtatalaga)

```ruby
tiyaking
matiyak
tiyakin
siguraduhing
siguraduhin
panigurado
```

Halimbawa

```ruby
simulan
  itaas "May sira!"
agapan
  mag_print "Ipagpatuloy..."
  itaas "May nasira na na-agapan"
tiyaking
  mag_print "Tapos na"
wakas
```

### grupo

Ang grupo ay ang lalagyanan ng mga kabilang na klase sa iyong program

```ruby
grupo
```

Halimbawa

```ruby
grupo Hayop
  KABUUAN = 5

  bilang Aso
    ang tahol
      mag_print "Woof..."
    wakas

    ang kumanin
      mag_print "..."
    wakas

    ang ikembot_ang_buntot
      mag_print "Ginagawa ko ito dahil masaya ako!"
    wakas
  wakas
wakas

dami = 6
browny = Hayop::Aso.kumatawan
browny.ikembot_ang_buntot kapag dami >= Hayop::KABUUAN
```

### ngunit_kapag

Gumamit ng ngunit_kapag kapag mayroon ka pang kondisyon maliban sa nauna ng
kondisyon

```ruby
ngunit_kapag
kung_kapag
ngunit_kapag_ang
kung_kapag_ang
```

Halimbawa

```ruby
pangalan_mo = "Masipag"
kapag_ang pangalan_mo == "Matipuno"
  mag_print "Ikaw ay si Matipuno!"
ngunit_kapag_ang pangalan_mo == "Masipag"
  mag_print "Ikaw ay si Masipag!"
maliban_sa_mga_ito
  mag_print "Wala kang rekord saamin!"
wakas
```

### ang

Ang ang ay may kalakip na pangalan upang ito ay matawag sa program

```ruby
ang
panuntunan
panuntunang
```

Halimbawa

```ruby
ang id(estudyante = {})
  pangalan = estudyante[:pangalan]
  edad     = estudyante[:edad]
  tirahan  = estudyante[:tirahan]
  baitang  = estudyante[:baitang]
  seksiyon = estudyante[:seksiyon]

  mag_print <<-KATAPUSAN
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
```

### agapan

Ang agapan ay ginagamit kung mayroon maaaring mangyaring pagkakamali na gusto
mong maisalba o mailigtas

```ruby
iligtas
agapan
```

Halimbawa

```ruby
simulan
  1 / 0
agapan
  mag_print "Hindi ito posible!"
wakas
```

### dapat

Kapag mayroon kang ekspresyon na mayroong inaasahan na resulta, gumamit ng dapat

```ruby
dapat
```

Halimbawa

```ruby
panulat_mo = "lapis"

papel = sakaling panulat_mo
  ay "lapis" dapat "bond paper"
  ay "ballpen" dapat "dilaw na papel"
  maliban_sa_mga_ito "intermediate paper"
wakas

mag_print "Ang papel na gagamitin mo ay #{papel}"
```

### magbigay_daan

Kapag ang ekspresyon ay mayroong inaasahang dapat na ibigay na resulta habang
gumagana pa ang program, gumamit ng magbigay_daan

```ruby
magbigay_daan
bigyang_daan
```

Halimbawa

```ruby
ang gumawaNgID
  mag_print "------------------------------------------"
  magbigay_daan
  mag_print "------------------------------------------"
wakas

ang ID(impormasyon = {})
  gumawaNgID na_ganito
    mag_print <<-KATAPUSAN
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
```

### para_sa

Kapag may listahan na nais mong isa isahin, gumamit ng para_sa

```ruby
para_sa
para_ang
```

Halimbawa

```ruby
listahan_ng_mga_prutas = ["mansanas", "mangga", "guava", "santol", "ubas"]
para_sa prutas na_nasa listahan_ng_mga_prutas ganito_gawin
  mag_print prutas.sa_malaking_titik
wakas
```

### subukang_muli

Ginagamit ang subukang_muli upang umikot muli ang ekspresyon kung may sirang
nangyari at nais mo ulit subukan pa andarin

```ruby
subukang_muli
```

Halimbawa

```ruby
bilang_ng_pagkakamali = 0
simula
  1 / 0
agapan => pagkakamali
  bilang_ng_pagkakamali += 1
  subukang_muli kapag bilang_ng_pagkakamali < 3
  iangat "malubhang pagkakamali"
siguraduhing
  mag_print "Tapos na"
wakas
```

### ibalik

Kapag mayroon kang ibabalik na resulta sa nagtawag ng ang

```ruby
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
```

Halimbawa

```ruby
ang magdagdag_ng_isa(halaga)
  idadagdag = halaga + 1
  ibalik_ang halaga
wakas
```

### kapag

Ginagamit ang kapag kung meron kang kondisyon sa iyong ekspresyon

```ruby
kapag
kapag_ang
kapag_na_ang
kung
kung_ang
```

Halimbawa

```ruby
kapag_ang 1 > 0
  mag_print "mas madami!"
kung_iba
  mag_print "may sira"
wakas
```

### bilang

Ang bilang ay ang pagsasabilang ng isang kaukulang klasipikasyon

```ruby
bilang
```

Halimbawa

```ruby
grupo Tinapay
  bilang Donut
    ang flavor
      mag_print 'Strawberry!'
    wakas
  wakas
wakas

tinapay = Tinapay::Donut.kumatawan
tinapay.flavor
=> 'Strawberry!'
```

### habang

Gumamit ng habang kung may hinihintay pa na resulta, kondisyon o pangyayari

```ruby
habang
habang_ang
```

Halimbawa

```ruby
may_buhay = totoo

habang may_buhay
  mag_print 'may pag-asa!'
  hinto
wakas
=> 'may pag-asa!'
```

### alyas

Gumamit ng alyas kung kailangan mo tawagin sa ibang pangalan ang iyong
panuntunan

```ruby
alyas
```

Halimbawa

```ruby
bilang Hayop
  ang aso
    mag_print 'si browny ay mabait!'
  wakas
  alyas browny aso
wakas

hayop = Hayop.kumatawan
hayop.browny
=> 'si browny ay mabait!'
```

### nakatukoy?

Ang nakatukoy? ay ginagamit kung kailangan malaman kung umiiral ang isang grupo
o klase

```ruby
nakatukoy?
nakasaad?
```

Halimbawa

```ruby
grupo Manggagawa
  bilang Magsasaka
    ang pananim
      ['sibuyas', 'kamatis', 'palay', 'mais'].isaisahin na_ganito |pananim|
        mag_print "Mag tatanim ng #{pananim} ngayong panahon"
      wakas
    wakas
  wakas
wakas

kung nakatukoy?(Manggagawa::Magsasaka)
  mag_print 'May nakatukoy!'
wakas
```

### tanggalin

Ginagamit ang tanggalin kung may tatanggaling panuntunan sa isang klase

```ruby
tanggalin
magtanggal
```

Halimbawa

```ruby
grupo Hayop
  bilang Aso
    ang tahol
      mag_print 'baw waw!'
    wakas
  wakas
wakas

bilang Pusa < Hayop::Aso
  tanggalin tahol
  ang meow
    mag_print 'meow wahu!'
  wakas
wakas

pusa = Pusa.kumatawan

simulan
  pusa.tahol
agapan => pagkakamali
  mag_print "ang pagkakamali ay '#{pagkakamali}'"
wakas
```

### ihinto

Gumamit ng 'hinto' kung may nais kang matapos na kondisyon gamit ang 'habang'

```ruby
ihinto
hinto
```

Halimbawa

```ruby
nakamit = mali

habang nakamit == mali
  mag_print 'hindi pa nakakamit!'
  hinto
wakas

mag_print 'nakamit na!'
```

### sa

Ginagamit ang 'sa' kung nais mong matukoy ang kasulukuyang listahan

```ruby
sa
sa_loob_ng
nasa
na_nasa
```

Halimbawa

  Tignan ang [para_sa](#para_sa)

### ganito

Ginagamit ang 'ganito' kung nais mong i konteksto ang kasulukuyang listahan

```ruby
na_ganito
nang_ganito
ganito
```

Halimbawa

  Tignan ang [magbigay_daan](#magbigay_daan), [nakatukoy?](#nakatukoy?)

### hanggang

Ang 'hanggang' ay magpapatuloy tumakbo hanggang maabot ang tamang kundisyon.

```ruby
hanggang
hanggang_ang
mapa_hanggang
```

Halimbawa

```ruby
pambilang = 0
panghuling_numero = 5
simula
  mag_print "Ang numero ay #{pambilang} na"
  pambilang += 1
wakas hanggang pambilang < panghuling_numero
```

### maliban_na

```ruby
malibang
maliban_na
maliban_ang
```

Halimbawa

```ruby
mga_persona = [
  { pangalan: 'Gener', kasarian: 'lalaki' },
  { pangalan: 'Karmen', kasarian: 'babae' }
]

mga_persona.isaisahin ng_ganito |tao|
  malibang tao[:kasarian] == 'lalaki'
    mag_print "si #{tao[:pangalan]} ay babae!"
  maliban_dito
    mag_print "si #{tao[:pangalan]} ay lalaki!"
  wakas
wakas
```

### o

Ang 'o' ay ginagamit upang piliin ang nagsasauli ng tama.

```ruby
o
o_ang
```

Halimbawa

```ruby
totoo o mali
=> totoo
```

### katangian

Ang 'katangian' ay ginagamit upang makapag takda at makapag basa ng *value* sa
katangian na ipinahayag sa loob ng grupo.

```ruby
katangian
panguri
```

Halimbawa

```ruby
bilang Robot
  katangian :pangalan, :kakayahan

  ang magpakilala
    mag_print <<-INTRO
        Ako ay isang Robot!
        Ang pangalan ko ay "#{sariling.pangalan}"
        Ako ay may kakayahang mag "#{sariling.kakayahan}"
    INTRO
  wakas
wakas

robot = Robot.gumawa
robot.pangalan = "bot-chukoy"
robot.kakayahan = "tambling"
robot.magpakilala
```

### ulit-ulitin

Ang 'ulit-ulitin' ay ginagamit upang paikot-ikutin ang ekspresyon hanggang
ihinto ito kapag natupad ang isang kondisyon.

```ruby
paulit_ulit
ulit_ulitin
```

Halimbawa

```ruby
pambilang = 0

paulit_ulit na_ganito
  ihinto kapag_ang pambilang == 10
  mag_print pambilang
  pambilang += 1
wakas
```

## Pagtulong sa pagdedevelop ng Bato

Magpadala ng mga kahilingan sa paggawa ng ticket.

## Lisensya

Instituto Ng Tekonolohiya sa Massachusetts License (makikita sa LICENSE.txt na file).
