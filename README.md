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
	  isulat "Kamusta mundo!"
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

## Pagtulong sa pagdedevelop ng Bato

Magpadala ng mga kahilingan sa paggawa ng ticket.

## Lisensya

Instituto Ng Tekonolohiya sa Massachusetts Licence (makikita sa LICENSE.txt na file).
