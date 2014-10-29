syntax keyword javascriptBOMWindowProp applicationCache closed Components controllers
syntax keyword javascriptBOMWindowProp crypto dialogArguments document frameElement
syntax keyword javascriptBOMWindowProp frames fullScreen history innerHeight innerWidth
syntax keyword javascriptBOMWindowProp length location locationbar menubar messageManager
syntax keyword javascriptBOMWindowProp name navigator opener outerHeight outerWidth
syntax keyword javascriptBOMWindowProp pageXOffset pageYOffset parent performance
syntax keyword javascriptBOMWindowProp personalbar returnValue screen screenX screenY
syntax keyword javascriptBOMWindowProp scrollbars scrollMaxX scrollMaxY scrollX scrollY
syntax keyword javascriptBOMWindowProp self sidebar status statusbar toolbar top window
syntax cluster props add=javascriptBOMWindowProp
if exists("did_javascript_hilink") | HiLink javascriptBOMWindowProp Structure
endif
syntax keyword javascriptBOMWindowMethod alert atob blur btoa clearImmediate clearInterval nextgroup=javascriptFuncCallArg
syntax keyword javascriptBOMWindowMethod clearTimeout close confirm dispatchEvent nextgroup=javascriptFuncCallArg
syntax keyword javascriptBOMWindowMethod find focus getAttention getAttentionWithCycleCount nextgroup=javascriptFuncCallArg
syntax keyword javascriptBOMWindowMethod getComputedStyle getDefaulComputedStyle getSelection nextgroup=javascriptFuncCallArg
syntax keyword javascriptBOMWindowMethod matchMedia maximize moveBy moveTo open openDialog nextgroup=javascriptFuncCallArg
syntax keyword javascriptBOMWindowMethod postMessage print prompt removeEventListener nextgroup=javascriptFuncCallArg
syntax keyword javascriptBOMWindowMethod resizeBy resizeTo restore scroll scrollBy nextgroup=javascriptFuncCallArg
syntax keyword javascriptBOMWindowMethod scrollByLines scrollByPages scrollTo setCursor nextgroup=javascriptFuncCallArg
syntax keyword javascriptBOMWindowMethod setImmediate setInterval setResizable setTimeout nextgroup=javascriptFuncCallArg
syntax keyword javascriptBOMWindowMethod showModalDialog sizeToContent stop updateCommands nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptBOMWindowMethod
if exists("did_javascript_hilink") | HiLink javascriptBOMWindowMethod Structure
endif
syntax keyword javascriptBOMWindowEvent contained onabort onbeforeunload onblur onchange
syntax keyword javascriptBOMWindowEvent contained onclick onclose oncontextmenu ondevicelight
syntax keyword javascriptBOMWindowEvent contained ondevicemotion ondeviceorientation
syntax keyword javascriptBOMWindowEvent contained ondeviceproximity ondragdrop onerror
syntax keyword javascriptBOMWindowEvent contained onfocus onhashchange onkeydown onkeypress
syntax keyword javascriptBOMWindowEvent contained onkeyup onload onmousedown onmousemove
syntax keyword javascriptBOMWindowEvent contained onmouseout onmouseover onmouseup
syntax keyword javascriptBOMWindowEvent contained onmozbeforepaint onpaint onpopstate
syntax keyword javascriptBOMWindowEvent contained onreset onresize onscroll onselect
syntax keyword javascriptBOMWindowEvent contained onsubmit onunload onuserproximity
syntax keyword javascriptBOMWindowEvent contained onpageshow onpagehide
syntax cluster events add=javascriptBOMWindowEvent
if exists("did_javascript_hilink") | HiLink javascriptBOMWindowEvent Keyword
endif
syntax keyword javascriptBOMWindowCons DOMParser QueryInterface XMLSerializer
if exists("did_javascript_hilink") | HiLink javascriptBOMWindowCons Structure
endif
