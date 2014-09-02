$ ->
  chatController =
    __name: "ChatController"
    __templates: "views/messages.ejs"
    chatLogic: ChatLogic
    __ready: ->
      me = this
      this.$find("#name").val $.cookie('name')
      this.chatLogic.getData()
      .done (messages) ->
        me.view.append ".messages", 'messages_template', messages: messages
      .fail (data) ->
        console.log 'error', data  
    ".submit-button click": (context) ->
      context.event.preventDefault()
      me = this
      params =
        name: this.$find("#name").val()
        word: this.$find("#word").val()
      $.cookie 'name', params.name
      this.chatLogic.postData(params)
      .done (message) ->
        me.view.prepend ".messages", 'messages_template', messages: [message]
      .fail (data) ->
        console.log 'error', data
  h5.core.controller ".container", chatController
  NCMB.initialize "e617bee762e6c0799d20bc3ef45ead1ee87c99276c482a3c5b6b90e013d8a669"
  