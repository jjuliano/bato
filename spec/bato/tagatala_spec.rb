
require 'spec_helper'

isalaysay_ang 'Tagatala' do
  italaga_ang(:pasimulang_kodigo) do
    "# encoding: utf-8\nrequire \"bato/core_ext\"\n"
  end

  italaga_ang(:tagatala) do
    Bato::Tagatala.new
  end

  ito_ang 'walang lamang program na Bato' do
    tagatala.sa_ruby('').should == pasimulang_kodigo + ''
  end

  isalaysay_ang 'bilang' do
    ito_ang 'pambuong bilang' do
      tagatala.sa_ruby('1').should == pasimulang_kodigo + '1'
    end

    ito_ang 'maliliit na bilang' do
      tagatala.sa_ruby('1.2').should == pasimulang_kodigo + '1.2'
    end

    ito_ang 'listahan ng mga bilang' do
      tagatala.sa_ruby('[1.2, 3]').should == pasimulang_kodigo + '[1.2, 3]'
    end
  end

  isalaysay_ang 'ekspresyong Boolean' do
    ito_ang 'ekspresyon ng tama o true' do
      tagatala.sa_ruby('tama').should == pasimulang_kodigo + 'true'
    end

    ito_ang 'ekspresyon ng mali o false' do
      tagatala.sa_ruby('mali').should == pasimulang_kodigo + 'false'
    end

    ito_ang 'ekspresyon ng hindi o not' do
      tagatala.sa_ruby('hindi tama').should == pasimulang_kodigo + '(not true)'
    end
  end

  isalaysay_ang 'susing mga salita' do
    ito_ang 'ekspresyon ng kapag / dapat / kung_kapag / kung_hindi / katapusan' do
      tagatala.sa_ruby('
        kapag 1 dapat
          2
        kung_kapag 3
          4
        kung_hindi
          5
        katapusan').should be_like(pasimulang_kodigo +
        '1 ? (2) : (3 ? (4) : (5))')
    end

    ito_ang 'ekspresyon ng kung_sakaling / pagka / dapat / kung_hindi / katapusan' do
      tagatala.sa_ruby("
        kung_sakaling 1
        pagka 1 dapat 1
        pagka 2
          2
        kung_hindi
          3
        katapusan").should be_like(pasimulang_kodigo +
        'case 1
        when 1 then
          1
        when 2 then
          2
        else
          3
        end')
    end

    ito_ang 'simula / iligtas / iangat / siguraduhing / katapusan' do
      # raise ir Kernel metode nevis atslēgvārds
      tagatala.sa_ruby('
        simula
          1 / 0
        iligtas => pagkakamali
          subukang_muli
          iangat pagkakamali, pagkakamali.iulat
        siguraduhing
          mag_print "Katapusan"
        katapusan').should be_like(pasimulang_kodigo +
        'begin
          (1 / 0)
        rescue => pagkakamali
          retry
          iangat(pagkakamali, pagkakamali.iulat)
        ensure
          mag_print("Katapusan")
        end')
    end
  end

  isalaysay_ang 'pamamaraan sa Kernel' do
    ito_ang "ekspresyon ng pagsusulat gamit ang 'mag_print'" do
      tagatala.sa_ruby("mag_print 'abc'").should ==
        pasimulang_kodigo + 'mag_print("abc")'
    end
  end

  isalaysay_ang 'Dinikit na mga pamamaraan' do
    ito_ang 'ekspresyon ng pamamaraan sa pagbabaliktad ng mga titik' do
      resulta = eval tagatala.sa_ruby("'magandang araw'.baliktad")
      resulta.should == 'wara gnadnagam'
    end

    ito_ang 'ekspresayon ng pamamaraan sa pagsukat ng haba ng salita' do
      resulta = eval tagatala.sa_ruby("'Pangungusap'.haba")
      resulta.should == 11
    end
  end
end
