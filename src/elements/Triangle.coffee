class Triangle extends PIXI.Graphics

    dir: 1
    dropDown: false
    alpha: 1

    constructor: (t, app) ->
        super()
        @app = app
        @data = t
        @beginFill(@data.color)
        @lineStyle(4, @data.color, 0)
        @moveTo(@x, @y)
        @lineTo(-5, 20)
        @lineTo(5, 20)
        @x = @data.x
        @y = @data.y
        @posOne = @data.lineOne
        @posTwo = @data.lineTwo
        @posThree = @data.lineThree
        @posFour = @data.lineFour
        @alpha = 1
        @endFill()

module.exports = Triangle