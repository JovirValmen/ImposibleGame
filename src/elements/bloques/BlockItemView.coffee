class BlockItemView extends PIXI.Graphics

    constructor: (model, container) ->
        super()
        @radio = container.radio
        @model = model
        @container = container
        @container.app.addAnimationNodes(@)
        @build()

    build: =>
        @beginFill(0xFFFF00, 0)
        @drawRect(0, 0, @model.width, @model.height)
        @endFill()
        @x = @model.x
        @y = @model.y
        @container.addChild(@)
        @buildSizes()

    buildSizes: () =>
        #left
        @beginFill(0xFFF000, 0)
        @drawRect(1, 0, 1, @model.height)
        @endFill()
        #top
        @beginFill(0xFFF000, 0)
        @drawRect(0, -1, @model.width, 1)
        @endFill()
        #right
        @beginFill(0xFFF000, 0)
        @drawRect(1, 0, @model.width, @model.height)
        @endFill()
        #down
        @beginFill(0xFFF000, 0)
        @drawRect(1, 1, @model.width, @model.height)
        @endFill()

    animate: =>
       @heroPosition()
       @colisions()

    colisions:=>
        #if (@heroX < @x + @model.width && @heroX + @heroWidth > @x && @heroY < @y + @model.height && @heroHeight + @heroY > @y)
        #left
        if (@heroX < @x - 10 + 10 && @heroX + @heroWidth > @x - 10 && @heroY < @y + @model.height && @heroHeight + @heroY > @y)
            @radio.emit 'left:wall', 2
        #top
        if (@heroX < @x + @model.width && @heroX + @heroWidth > @x && @heroY < @y - 10 + 10 && @heroHeight + @heroY > @y - 10)
            @radio.emit 'pongan:piso', 2
        #right
        if (@heroX <@x+ @model.width - 5 && @heroX + @heroWidth > @x+@model.width && @heroY < @y + @model.height && @heroHeight + @heroY > @y)
            @radio.emit 'right:wall', 2
        #bot
        if (@heroX < @x + @model.width && @heroX + @heroWidth > @x && @heroY < @y+@model.height - 1 && @heroHeight + @heroY > @y+@model.height)
            @container.app.hero.jumping = 0

    heroPosition: =>
       @heroX = @container.app.hero.x - @container.app.hero.w / 2
       @heroY = @container.app.hero.y - @container.app.hero.h / 2
       @heroWidth = @container.app.hero.w
       @heroHeight = @container.app.hero.h


module.exports = BlockItemView