# backbone view for a filelist item

# require the gerber layer options
layerOptions = require '../layer-options'

module.exports = Backbone.View.extend {
  # dom element is a list item with some classes
  tagName: 'li'
  className: 'UploadList--item'
  # cached template function
  template: _.template $('#filelist-item-template').html()

  # events
  events: {
    # delete button
    'click .UploadList--itemDelete': 'removeLayer'
    # layer select
    'change .UploadList--SelectMenu': 'changeLayerType'
  }

  # render method
  render: ->
    @$el.html @template {
      filename: @model.get 'filename'
      type: @model.get 'type'
      options: layerOptions
    }
    # initially select the correct option
    @$el.find("option[value='#{@model.get 'type'}']").prop 'selected', true
    # return this
    return @

  # remove layer
  removeLayer: ->
    # delete the dom element
    @$el.remove()
    # remove the model from the collection
    @model.collection.remove @model

  # change the layer type
  changeLayerType: ->
    @model.set 'type', @$el.find('option:selected').attr 'value'

}
