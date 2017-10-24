# Bato

Ang 'Bato' ay ang unang programming language sa wikang Tagalog.

## Pagtatalaga

Kailangan mo munang i-install ang Ruby programming language (version 1.9.3 o mas bago)
at pagkatapos maitalaga ang Ruby, i-run naman ito

    gem install bato

## Bakit Bato?

Ang 'bato' ay hango sa [Ruby Programming Language](http://www.ruby-lang.org/) na may Tagalog na sintaks.
Ang kadahilanang ginamit ang pangalang 'bato' ay dahil ang Ruby ay isang uri ng bato.

## Ang unang program

Gumawa ng isang file na kamusta_mundo.bato na may mga sumusunod na nilalaman

	kapag 1 > 0
	  isulat "Kumusta mundo!"
	kung_hindi
	  isulat "Mayroong sira"
	katapusan

at pa-andarin ang program sa pamamagitan ng

    bato kamusta_mundo.bato

## Sintaks

### Pagsusulat

    "Ito ay mga serye ng mga sulat sa wikang Tagalog"
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
    katapusan

    kung_sakaling bilang
    pagka 5 dapat "lima"
    pagka 4 dapat "apat"
    kung_hindi "wala"
    katapusan

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
      isulat "Tapos na"
    katapusan

### Panuntunan

	panuntunang sabihinAngPangalan(pangalan = wala)
	  kapag pangalan != wala
	    isulat "Magandang araw sa iyo #{pangalan}!"
	  kung_hindi
	    isulat "Magandang araw!"
	  katapusan
	katapusan
	
	sabihinAngPangalan "Maria" # => "Magandang araw sa iyo Maria!"
	sabihinAngPangalan 		   # => "Magandang araw!"


## Paggamit ng mga ekspresyon ng mga salita sa program

### katapusan

Maari kang gumamit sa alin sa mga sumusunod sa pagtatapos ng program

	katapusan
	dulo
	wakas

Sampol ng paggamit

	bilang = 0
	kapag bilang > 1
	  isulat "Mayroon ng laman ang bilang na #{bilang}"
	kung_hindi
	  isulat "Wala pang laman ang bilang"
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

Sampol ng paggamit

	pangalan_mo = "Maliksi"
	kapag_ang pangalan_mo == "Maliksi"
	  isulat "Ikaw ay si #{pangalan_mo}!"
	kung_hindi_naman
	  isulat "Magandang araw sa iyo #{pangalan_mo}!"
	katapusan

### sakali

Kapag mayroon kang ekspresyon na madaming resulta gawa ng mga iba't ibang kondisyon, maari kang gumamit ng mga sumusunod

	sakaling
	sakali
	kung_sakaling
	sakali_na
	kung_sakali_na
	kalagayan
	kaukulan

Sampol ng paggamit

	pangalan_mo = "Mabait"
	
	sakaling pangalan_mo
	ay "Maliksi"
	  isulat "Ikaw ay si Maliksi!"
	ay "Matipuno"
	  isulat "Ikaw ay si Matipuno!"
	ay "Mabait"
	  isulat "Ikaw ay si Mabait!"
	maliban_dito
	  isulat "Magandang araw sa iyo!"
	katapusan

### tiyakin

Kung mayroon kang ekspresyon na gusto mong masunod kahit ano pa ang kahihinatnan nito, gumamit ng mga sumusunod

	tiyaking
	matiyak
	tiyakin
	siguraduhing
	siguraduhin
	panigurado

Sampol ng paggamit

	simulan
	  itaas "May sira!"
	agapan
	  isulat "Ipagpatuloy..."
	  itaas "May nasira na na-agapan"
	tiyaking
	  isulat "Tapos na"
	katapusan

### modyul

Ang modyul ay ang lalagyanan ng mga klase sa iyong program

	modyul

Sampol ng paggamit

	modyul MgaAlagangHayop
	  KAILANGAN_DAMI_NG_ASO = 5
	  klase Aso
	    panuntunan tahol
	      sabihin "Woof..."
	    katapusan

	    panuntunan kumanin
	      sabihin "..."
	    katapusan

	    panuntunan ikembot_ang_buntot
	      sabihin "Ginagawa ko ito dahil masaya ako!"
	    katapusan
	  katapusan  
	katapusan

	dami = 6
	browny = MgaAlagangHayop::Aso.gumawa
	browny.ikembot_ang_buntot kapag dami >= MgaHayop::KAILANGAN_DAMI_NG_ASO

### ngunit_kapag

Gumamit ng ngunit_kapag kapag mayroon ka pang kondisyon maliban sa nauna ng kondisyon

	ngunit_kapag
	kung_kapag
	ngunit_kapag_ang
	kung_kapag_ang

Sampol ng paggamit

	pangalan_mo = "Masipag"
	kapag_ang pangalan_mo == "Matipuno"
	  sabihin "Ikaw ay si Matipuno!"
	ngunit_kapag_ang pangalan_mo == "Masipag"
	  sabihin "Ikaw ay si Masipag!"
	maliban_sa_mga_ito
	  sabihin "Wala kang rekord saamin!"
	katapusan

### panuntunan

Ang panuntunan ay may kalakip na pangalan upang ito ay matawag sa program

	panuntunang
	panuntunan

Sampol ng paggamit

	panuntunan gumawaNgID(estudyante = {})
	  pangalan = estudyante[:pangalan]
	  edad 	   = estudyante[:edad]
	  tirahan  = estudyante[:tirahan]
	  baitang  = estudyante[:baitang]
	  seksiyon = estudyante[:seksiyon]
	  
	  sabihin <<-KATAPUSAN
	  	Pangalan: #{pangalan}
		Edad:     #{edad}
		Tirahan:  #{tirahan}
		Baitang:  #{baitang}
		Seksiyon: #{seksiyon}
	  KATAPUSAN
	katapusan
	
	gumawaNgID({
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

Sampol ng paggamit

	simulan
	  1 / 0
	agapan
	  sabihin "Hindi ito posible!"
	katapusan

### dapat

Kapag mayroon kang ekspresyon na mayroong inaasahan na resulta, gumamit ng dapat

	dapat

Sampol ng paggamit

	panulat_mo = "lapis"
	
	papel = sakaling panulat_mo
	  ay "lapis" dapat "bond paper"
	  ay "ballpen" dapat "dilaw na papel"
	  maliban_sa_mga_ito "intermediate paper"
	katapusan
	
	sabihin "Ang papel na gagamitin mo ay #{papel}"

### magbigay_daan

Kapag ang ekspresyon ay mayroong inaasahang dapat na ibigay na resulta habang gumagana pa ang program, gumamit ng magbigay_daan

	magbigay_daan
	bigyang_daan

Sampol ng paggamit

    panuntunan gumawaNgID
      isulat "------------------------------------------"
      magbigay_daan
      isulat "------------------------------------------"
    katapusan
	
    panuntunan ID(impormasyon = {})
      gumawaNgID na_ganito
        sabihin <<-KATAPUSAN
      Pangalan: #{impormasyon[:pangalan]}
      Edad:     #{impormasyon[:edad]}
      Tirahan:  #{impormasyon[:tirahan]}
      Baitang:  #{impormasyon[:baitang]}
      Seksiyon: #{impormasyon[:seksiyon]}
        KATAPUSAN
      katapusan
    katapusan
    
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

Sampol ng paggamit

	listahan_ng_mga_prutas = ["mansanas", "mangga", "guava", "santol", "ubas"]
	para_sa prutas na_nasa listahan_ng_mga_prutas ganito_gawin
	  sabihin prutas.sa_malaking_titik
	katapusan

### subukang_muli

Ginagamit ang subukang_muli upang umikot muli ang ekspresyon kung may sirang nangyari at nais mo ulit subukan pa andarin

	subukang_muli

Sampol ng paggamit

	bilang_ng_pagkakamali = 0
	simula
	  1 / 0
	agapan => pagkakamali
	  bilang_ng_pagkakamali += 1
	  subukang_muli kapag bilang_ng_pagkakamali < 3
	  iangat "malubhang pagkakamali"
	siguraduhing
	  isulat "Tapos na"
	katapusan

### ibalik

Kapag mayroon kang ibabalik na resulta sa nagtawag ng panuntunan

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

Sampol ng paggamit

	panuntunan magdagdag_ng_isa(halaga)
		idadagdag = halaga + 1
		ibalik_ang halaga
	katapusan

### kapag

Ginagamit ang kapag kung meron kang kondisyon sa iyong ekspresyon

	kapag
	kapag_ang
	kapag_na_ang
	kung
	kung_ang

Sampol ng paggamit

	kapag_ang 1 > 0
	  sabihin "mas madami!"
	kung_iba
	  sabihin "may sira"
	katapusan

## Patuloy na ginagawa ang dokumento para sa mga sumusunod...

### nakatukoy?

	nakatukoy?
	nakasaad?

### tanggalin

	tanggalin
	magtanggal

### ihinto

	ihinto

### sa

	sa
	sa_loob_ng
	nasa
	na_nasa

### ganito

	na_ganito
	nang_ganito
	ganito

### hanggang

	hanggang
	hanggang_ang
	mapa_hanggang

### maliban_na

	malibang
	maliban_na
	maliban_ang

### o

	o
	o_ang

### kasunod

	sumunod
	kasunod

### pagka

	pagka
	pagka_ang

### ulitin

	ulitin
	at_ulitin
	uliting_muli

### at

	at
	at_ang

### simula

	simula

### klase

	klase

### habang

	habang
	habang_ang

### alyas

	alyas

## Pagtulong sa pagdedevelop ng Bato

Magpadala ng mga kahilingan sa paggawa ng ticket.

## Lisensya

Instituto Ng Tekonolohiya sa Massachusetts Licence (makikita sa LICENSE.txt na file).
