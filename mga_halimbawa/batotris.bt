require 'io/console'

grupo Batotris
  BERSIYON = '0.1'.freeze
  palawigin sarili

  bilang Piyesa
    MGA_PIYESA = [
      [ [0, 1, 0, 0],
        [1, 1, 1, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0], ],

      [ [0, 1, 1, 0],
        [1, 1, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0], ],

      [ [1, 1, 0, 0],
        [0, 1, 1, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0], ],

      [ [1, 1, 1, 1],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0], ],

      [ [1, 1, 0, 0],
        [1, 1, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0], ],

      [ [1, 0, 0, 0],
        [1, 1, 1, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0], ],

      [ [0, 0, 1, 0],
        [1, 1, 1, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0], ],
    ]

    ang initialize(x, y, piyesa = bagong_bloke)
      @x = x
      @y = y
      @piyesa = piyesa
    wakas

    ang magiba_ng_posisyon
      bilang_ng_paglipat = 0
      ang_posisyon = Array.kumatawan(4)
      @piyesa.bilang_bawat_isa na_ganito |bloke, y|
        bloke.bilang_bawat_isa na_ganito |b, x|
          kapag b == 1
            ang_posisyon[bilang_ng_paglipat] = [ @x + x, @y + y ]
            bilang_ng_paglipat += 1
          wakas
        wakas
      wakas
      ang_posisyon
    wakas

    ang kanan
      Piyesa.kumatawan(@x + 1, @y, @piyesa)
    wakas

    ang kaliwa
      Piyesa.kumatawan(@x - 1, @y, @piyesa)
    wakas

    ang mahulog
      Piyesa.kumatawan(@x, @y + 1, @piyesa)
    wakas

    ang pagikot
      pansamantala = Array.kumatawan(4){ Array.kumatawan(4, 0)}
      @piyesa.bilang_bawat_isa na_ganito |linya, y|
        linya.bilang_bawat_isa na_ganito |l, x|
          pansamantala[x][y] = l
        wakas
      wakas
      pansamantala.bilang_bawat_isa na_ganito |linya, i|
        pansamantala[i] = linya.baliktad
      wakas
      Piyesa.kumatawan(@x, @y, pansamantala)
    wakas

    ang bagong_bloke
      rnd = rand(MGA_PIYESA.haba)
      MGA_PIYESA[rnd]
    wakas
  wakas

  grupo Pananda
    WALA = 0
    PADER = 1
    AKTIBO = 2
    NAKALINYA = 3
  wakas

  bilang Babagsakan
    LAWAK = 11
    TAAS = 20
    DAMI = 40
    PADER_LETRA = "🀫 "
    BLOCK_LETRA = "⚀ "
    WALA_LETRA = "  "
    panguri :dako

    ang initialize
      @sakop = gagalawan
      @dako  = 0
    wakas

    ang burahin
      @sakop.bilang_bawat_isa na_ganito |linya, y|
        linya.bilang_bawat_isa na_ganito |l, x|
          @sakop[y][x] = 0 kapag l == Pananda::AKTIBO
        wakas
      wakas
    wakas

    ang burahin_ang_linya
      @sakop.bilang_bawat_isa na_ganito |linya, y|
        kapag linya == [Pananda::PADER, Pananda::NAKALINYA, Pananda::NAKALINYA, Pananda::NAKALINYA, Pananda::NAKALINYA, Pananda::NAKALINYA, Pananda::NAKALINYA, Pananda::NAKALINYA, Pananda::NAKALINYA, Pananda::NAKALINYA, Pananda::PADER]
          @dako += 1
          @sakop.delete_at(y)
          @sakop.insert(0, [Pananda::PADER, Pananda::WALA, Pananda::WALA, Pananda::WALA, Pananda::WALA, Pananda::WALA, Pananda::WALA, Pananda::WALA, Pananda::WALA, Pananda::WALA, Pananda::PADER])
        wakas
      wakas
    wakas

    ang tapos_na?
      @dako >= 40
    wakas

    ang ay_bloke?(susunod_na_posisyon)
      resulta = mali
      susunod_na_posisyon.isaisahin na_ganito |pos|
        kapag isang_bloke?(pos[0], pos[1])
          resulta = tama
        wakas
      wakas
      resulta
    wakas

    ang ipirme(kasulukuyang_posisyon)
      kasulukuyang_posisyon.isaisahin na_ganito |pos|
        @sakop[pos[1]][pos[0]] = Pananda::NAKALINYA
      wakas
    wakas

    ang bago_ipirme(kasulukuyang_posisyon)
      kasulukuyang_posisyon.isaisahin na_ganito |pos|
        @sakop[pos[1]][pos[0]] = Pananda::AKTIBO
      wakas
    wakas

    ang write
      teksto = "\n\e[25D"
      @sakop.isaisahin na_ganito |linya|
        linya.isaisahin na_ganito |l|
          kapag l == Pananda::WALA
            teksto += WALA_LETRA
          kung_kapag l == Pananda::AKTIBO || l == Pananda::NAKALINYA
            teksto += BLOCK_LETRA
          kung_hindi
            teksto += PADER_LETRA
          wakas
        wakas
        teksto += "\n\e[25D"
      wakas
      mag_print teksto
    wakas

    private

    ang isang_bloke?(x, y)
      @sakop[y][x] == Pananda::PADER || @sakop[y][x] == Pananda::NAKALINYA
    wakas

    ang gagalawan
      f = []
      TAAS.beses na_ganito |i|
        linya = []
        LAWAK.beses na_ganito |j|
          linya[j] = (j == 0 || j == LAWAK - 1 || i == TAAS - 1) ? Pananda::PADER : Pananda::WALA
        wakas
        f[i] = linya
      wakas
      ibalik_ang f
    wakas
  wakas

  ang burahin_ang_screen
    print "\x1b[2J\x1b[0;0H"
  wakas

  ang mahulog_to_bloke(piyesa, sakop)
    resulta = piyesa
    loop na_ganito
      susunod_na_posisyon = resulta.mahulog.magiba_ng_posisyon
      kapag sakop.ay_bloke?(susunod_na_posisyon)
        isauli_ang resulta
      kung_hindi
        resulta = resulta.mahulog
      wakas
    wakas
  wakas

  ang tetris
    burahin_ang_screen

    sakop = Babagsakan.kumatawan
    sakop.write

    piyesa = Piyesa.kumatawan(5, 0)

    pinindot = 'n'
    thread = Thread::start na_ganito
      habang (pinindot = STDIN.getch)
        kapag pinindot == "\C-c"
          ihinto
        wakas
      wakas
    wakas

    loop na_ganito
      matulog(0.2)
      sarili.burahin_ang_screen
      mag_print "kaliwa: [left key], kanan: [right key], mahulog: [space], ikutin: [up key], q: exit \e[25D"
      mag_print "\e[25D#{sakop.dako}\e[25D"

      kung_sakaling pinindot
      ay 'q' dapat
        exit
      ay "D" dapat
        pansamantala = piyesa.kaliwa
      ay "C" dapat
        pansamantala = piyesa.kanan
      ay 'B' dapat
        pansamantala = sarili.mahulog_to_bloke(piyesa, sakop)
      ay ' ' dapat
        pansamantala = sarili.mahulog_to_bloke(piyesa, sakop)
      ay "A" dapat
        pansamantala = piyesa.pagikot
      kung_hindi
        pansamantala = piyesa.mahulog
      wakas

      susunod_na_posisyon = pansamantala.magiba_ng_posisyon

      kapag !sakop.ay_bloke?(susunod_na_posisyon)
            sakop.bago_ipirme(susunod_na_posisyon)
            piyesa = pansamantala

      kung_kapag pinindot != 'n'
        piyesa = piyesa
      kung_hindi
        sakop.ipirme(piyesa.magiba_ng_posisyon)
        piyesa = Piyesa.kumatawan(5, 0)
        susunod_na_posisyon = piyesa.magiba_ng_posisyon
        kapag sakop.ay_bloke?(susunod_na_posisyon)
          mag_print "game over"
          ihinto
        wakas
      wakas

      sakop.write
      sakop.burahin
      sakop.burahin_ang_linya

      pinindot = 'n'
      kapag sakop.tapos_na?
        mag_print "matagumpay!"
        ihinto
      wakas
    wakas
    Thread.kill(thread)
  wakas
wakas


Batotris.tetris