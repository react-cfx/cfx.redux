import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'

export default (
  actionCreatorsBinder = bindActionCreators
  dispatcher
) =>

  (getState, actions, Component, options, mergeProps) =>

    connect(

      (state) ->
        state: getState state

      (dispatch) ->
        dispatcher or= dispatch
        actions:
          actionCreatorsBinder actions, dispatcher
        
      mergeProps
      options

    ) Component
