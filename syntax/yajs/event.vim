syntax keyword javascriptAnimationEvent contained animationend animationiteration
syntax keyword javascriptAnimationEvent contained animationstart beginEvent endEvent
syntax keyword javascriptAnimationEvent contained repeatEvent
syntax cluster events add=javascriptAnimationEvent
if exists("did_javascript_hilink") | HiLink javascriptAnimationEvent Keyword
endif
syntax keyword javascriptCSSEvent contained CssRuleViewRefreshed CssRuleViewChanged
syntax keyword javascriptCSSEvent contained CssRuleViewCSSLinkClicked transitionend
syntax cluster events add=javascriptCSSEvent
if exists("did_javascript_hilink") | HiLink javascriptCSSEvent Keyword
endif
syntax keyword javascriptDatabaseEvent contained blocked complete error success upgradeneeded
syntax keyword javascriptDatabaseEvent contained versionchange
syntax cluster events add=javascriptDatabaseEvent
if exists("did_javascript_hilink") | HiLink javascriptDatabaseEvent Keyword
endif
syntax keyword javascriptDocumentEvent contained DOMLinkAdded DOMLinkRemoved DOMMetaAdded
syntax keyword javascriptDocumentEvent contained DOMMetaRemoved DOMWillOpenModalDialog
syntax keyword javascriptDocumentEvent contained DOMModalDialogClosed unload
syntax cluster events add=javascriptDocumentEvent
if exists("did_javascript_hilink") | HiLink javascriptDocumentEvent Keyword
endif
syntax keyword javascriptDOMMutationEvent contained DOMAttributeNameChanged DOMAttrModified
syntax keyword javascriptDOMMutationEvent contained DOMCharacterDataModified DOMContentLoaded
syntax keyword javascriptDOMMutationEvent contained DOMElementNameChanged DOMNodeInserted
syntax keyword javascriptDOMMutationEvent contained DOMNodeInsertedIntoDocument DOMNodeRemoved
syntax keyword javascriptDOMMutationEvent contained DOMNodeRemovedFromDocument DOMSubtreeModified
syntax cluster events add=javascriptDOMMutationEvent
if exists("did_javascript_hilink") | HiLink javascriptDOMMutationEvent Keyword
endif
syntax keyword javascriptDragEvent contained drag dragdrop dragend dragenter dragexit
syntax keyword javascriptDragEvent contained draggesture dragleave dragover dragstart
syntax keyword javascriptDragEvent contained drop
syntax cluster events add=javascriptDragEvent
if exists("did_javascript_hilink") | HiLink javascriptDragEvent Keyword
endif
syntax keyword javascriptElementEvent contained invalid overflow underflow DOMAutoComplete
syntax keyword javascriptElementEvent contained command commandupdate
syntax cluster events add=javascriptElementEvent
if exists("did_javascript_hilink") | HiLink javascriptElementEvent Keyword
endif
syntax keyword javascriptFocusEvent contained blur change DOMFocusIn DOMFocusOut focus
syntax keyword javascriptFocusEvent contained focusin focusout
syntax cluster events add=javascriptFocusEvent
if exists("did_javascript_hilink") | HiLink javascriptFocusEvent Keyword
endif
syntax keyword javascriptFormEvent contained reset submit
syntax cluster events add=javascriptFormEvent
if exists("did_javascript_hilink") | HiLink javascriptFormEvent Keyword
endif
syntax keyword javascriptFrameEvent contained DOMFrameContentLoaded
syntax cluster events add=javascriptFrameEvent
if exists("did_javascript_hilink") | HiLink javascriptFrameEvent Keyword
endif
syntax keyword javascriptInputDeviceEvent contained click contextmenu DOMMouseScroll
syntax keyword javascriptInputDeviceEvent contained dblclick gamepadconnected gamepaddisconnected
syntax keyword javascriptInputDeviceEvent contained keydown keypress keyup MozGamepadButtonDown
syntax keyword javascriptInputDeviceEvent contained MozGamepadButtonUp mousedown mouseenter
syntax keyword javascriptInputDeviceEvent contained mouseleave mousemove mouseout
syntax keyword javascriptInputDeviceEvent contained mouseover mouseup mousewheel MozMousePixelScroll
syntax keyword javascriptInputDeviceEvent contained pointerlockchange pointerlockerror
syntax keyword javascriptInputDeviceEvent contained wheel
syntax cluster events add=javascriptInputDeviceEvent
if exists("did_javascript_hilink") | HiLink javascriptInputDeviceEvent Keyword
endif
syntax keyword javascriptMediaEvent contained audioprocess canplay canplaythrough
syntax keyword javascriptMediaEvent contained durationchange emptied ended ended loadeddata
syntax keyword javascriptMediaEvent contained loadedmetadata MozAudioAvailable pause
syntax keyword javascriptMediaEvent contained play playing ratechange seeked seeking
syntax keyword javascriptMediaEvent contained stalled suspend timeupdate volumechange
syntax keyword javascriptMediaEvent contained waiting complete
syntax cluster events add=javascriptMediaEvent
if exists("did_javascript_hilink") | HiLink javascriptMediaEvent Keyword
endif
syntax keyword javascriptMenuEvent contained DOMMenuItemActive DOMMenuItemInactive
syntax cluster events add=javascriptMenuEvent
if exists("did_javascript_hilink") | HiLink javascriptMenuEvent Keyword
endif
syntax keyword javascriptNetworkEvent contained datachange dataerror disabled enabled
syntax keyword javascriptNetworkEvent contained offline online statuschange connectionInfoUpdate
syntax cluster events add=javascriptNetworkEvent
if exists("did_javascript_hilink") | HiLink javascriptNetworkEvent Keyword
endif
syntax keyword javascriptProgressEvent contained abort error load loadend loadstart
syntax keyword javascriptProgressEvent contained progress timeout uploadprogress
syntax cluster events add=javascriptProgressEvent
if exists("did_javascript_hilink") | HiLink javascriptProgressEvent Keyword
endif
syntax keyword javascriptResourceEvent contained cached error load
syntax cluster events add=javascriptResourceEvent
if exists("did_javascript_hilink") | HiLink javascriptResourceEvent Keyword
endif
syntax keyword javascriptScriptEvent contained afterscriptexecute beforescriptexecute
syntax cluster events add=javascriptScriptEvent
if exists("did_javascript_hilink") | HiLink javascriptScriptEvent Keyword
endif
syntax keyword javascriptSensorEvent contained compassneedscalibration devicelight
syntax keyword javascriptSensorEvent contained devicemotion deviceorientation deviceproximity
syntax keyword javascriptSensorEvent contained orientationchange userproximity
syntax cluster events add=javascriptSensorEvent
if exists("did_javascript_hilink") | HiLink javascriptSensorEvent Keyword
endif
syntax keyword javascriptSessionHistoryEvent contained pagehide pageshow popstate
syntax cluster events add=javascriptSessionHistoryEvent
if exists("did_javascript_hilink") | HiLink javascriptSessionHistoryEvent Keyword
endif
syntax keyword javascriptStorageEvent contained change storage
syntax cluster events add=javascriptStorageEvent
if exists("did_javascript_hilink") | HiLink javascriptStorageEvent Keyword
endif
syntax keyword javascriptSVGEvent contained SVGAbort SVGError SVGLoad SVGResize SVGScroll
syntax keyword javascriptSVGEvent contained SVGUnload SVGZoom
syntax cluster events add=javascriptSVGEvent
if exists("did_javascript_hilink") | HiLink javascriptSVGEvent Keyword
endif
syntax keyword javascriptTabEvent contained visibilitychange
syntax cluster events add=javascriptTabEvent
if exists("did_javascript_hilink") | HiLink javascriptTabEvent Keyword
endif
syntax keyword javascriptTextEvent contained compositionend compositionstart compositionupdate
syntax keyword javascriptTextEvent contained copy cut paste select text
syntax cluster events add=javascriptTextEvent
if exists("did_javascript_hilink") | HiLink javascriptTextEvent Keyword
endif
syntax keyword javascriptTouchEvent contained touchcancel touchend touchenter touchleave
syntax keyword javascriptTouchEvent contained touchmove touchstart
syntax cluster events add=javascriptTouchEvent
if exists("did_javascript_hilink") | HiLink javascriptTouchEvent Keyword
endif
syntax keyword javascriptUpdateEvent contained checking downloading error noupdate
syntax keyword javascriptUpdateEvent contained obsolete updateready
syntax cluster events add=javascriptUpdateEvent
if exists("did_javascript_hilink") | HiLink javascriptUpdateEvent Keyword
endif
syntax keyword javascriptValueChangeEvent contained hashchange input readystatechange
syntax cluster events add=javascriptValueChangeEvent
if exists("did_javascript_hilink") | HiLink javascriptValueChangeEvent Keyword
endif
syntax keyword javascriptViewEvent contained fullscreen fullscreenchange fullscreenerror
syntax keyword javascriptViewEvent contained resize scroll
syntax cluster events add=javascriptViewEvent
if exists("did_javascript_hilink") | HiLink javascriptViewEvent Keyword
endif
syntax keyword javascriptWebsocketEvent contained close error message open
syntax cluster events add=javascriptWebsocketEvent
if exists("did_javascript_hilink") | HiLink javascriptWebsocketEvent Keyword
endif
syntax keyword javascriptWindowEvent contained DOMWindowCreated DOMWindowClose DOMTitleChanged
syntax cluster events add=javascriptWindowEvent
if exists("did_javascript_hilink") | HiLink javascriptWindowEvent Keyword
endif
syntax keyword javascriptUncategorizedEvent contained beforeunload message open show
syntax cluster events add=javascriptUncategorizedEvent
if exists("did_javascript_hilink") | HiLink javascriptUncategorizedEvent Keyword
endif
