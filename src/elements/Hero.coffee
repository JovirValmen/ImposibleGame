class Hero extends PIXI.Graphics

    color: null
    posX: null
    posY: null
    w: null
    h: null
    transition: false
    floor: false
    jumping: 0
    jumpCount: 0
    jumpMax: 2
    gravity: 0.6
    gravitySpeed: 0
    speedY: 0

    constructor: (c, x, y, w, h, score, app) ->
        super()
        @app = app
        @radio = @app.radio
        @color = c
        @posX = x
        @posY = y
        @w = w
        @h = h
        @alpha = 1
        @draw()
        window.addEventListener 'keypress', @onKeyPress
        window.addEventListener 'keyup', @onKeyUp
        @radio.on 'pongan:piso', @onCollider
        @radio.on 'left:wall', @leftW
        @radio.on 'right:wall', @rightW

    draw: () =>
        @beginFill(@color, @alpha)
        @drawRect(@posX, @posY, @w, @h)
        @endFill()

    onCollider: (modelo) =>
        if modelo == 2
            @floor = true
        else
            @floor = false

    leftW: (modelo) =>
        if modelo == 2
            @leftTop = true
        else
            @leftTop = false

    rightW: (modelo) =>
        if modelo == 2
            @rightTop = true
        else
            @rightTop = false

    onKeyPress: (evt) =>
        if evt.key is 'd' || evt.key is 'D'
            @right = true

        if evt.key is 'w' || evt.key is 'W'
            @up = true

        if evt.key is 'a' || evt.key is 'A'
            @left = true

    onKeyUp: (evt) =>
        if evt.key is 'w' || evt.key is 'W'
            null

        if evt.key is 'd' || evt.key is 'D'
            @right = false

        if @transition && @left
            @transition = false
            @right = false
        null

        if evt.key is 'a' || evt.key is 'A'
            @left = false

        if @transition && @right
            @left = false
            @transition = false
        null

    Die: (arr) ->
        for n in arr
            if (@.x < n.x + n.width && @.x + @.w > n.x && @.y < n.y + n.height && @.h + @.y > n.y)
                console.log 'moriste'
                @x = 20
                @y = 550

    animate: () =>
        @moving()
        @onCollider()
        @leftW()
        @rightW()
#        @doubleJump()

    moving: () =>
        if @floor is false
            @up = false
        if @up is true
            @jumping = 10

        @.y -= @jumping

        if @jumping >= 0.5
            @jumping -= 0.5

        if @floor is false
            @.y += 5

        if @right is true && @leftTop is false
            @.x += 3

        if @right is true
            @transition = true

        if @left is true && @rightTop is false
            @.x -= 3

#    doubleJump: () =>
#        @up = true
#        if @jumpCount < @jumpMax
#            @moving()
#            @jumpCount++

module.exports = Hero
