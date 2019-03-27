class Hero extends PIXI.Graphics

    color: null
    posX: null
    posY: null
    w: null
    h: null
    speedX: 0
    speedY: 0
    gravity: 0.6
    gravitySpeed: 0
    score: 0
    pause: false

    constructor: (c, x, y, w, h, score) ->
        super()
        @color = c
        @posX = x
        @posY = y
        @w = w
        @h = h
        @score = score
        @draw()

    draw: () =>
        @beginFill(@color)
        @drawRect(@posX, @posY, @w, @h)
        @endFill()

    animate: () =>
        if @pause is true then return
        @gravitySpeed += @gravity
        @x += @speedX
        @y += @speedY + @gravitySpeed
#        if @y >= 550
#            @gravitySpeed = -@gravity
#            @y = 550

module.exports = Hero
