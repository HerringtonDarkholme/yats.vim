" Vim syntax file
" Language:     JavaScript
" Maintainer:   Kao Wei-Ko <othree@gmail.com>
" Maintainer:   Jose Elera Campana <https://github.com/jelera>
" Last Change:  2013-02-19
" Version:      0.8
" Changes:      Go to https://github.com/othree/vim-javascript-syntax for
"               recent changes.
" Origin:       https://github.com/jelera/vim-javascript-syntax
" Credits:      Zhao Yi, Claudio Fleiner, Scott Shattuck (This file is based
"               on their hard work), gumnos (From the #vim IRC Channel in
"               Freenode)

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'javascript'
endif

" Drop fold if it set but vim doesn't support it.
if version < 600 && exists("javaScript_fold")
  unlet javaScript_fold
endif

"" dollar sign is permitted anywhere in an identifier
setlocal iskeyword+=$

syntax sync fromstart

"" syntax coloring for Node.js shebang line
syntax match   shellbang "^#!.*/bin/env\s\+node\>"


" JavaScript comments
syntax keyword javascriptCommentTodo      TODO FIXME XXX TBD contained
syntax match   javascriptLineComment      "\/\/.*" contains=@Spell,javascriptCommentTodo
syntax match   javascriptCommentSkip      "^[ \t]*\*\($\|[ \t]\+\)"
syntax region  javascriptComment          start="/\*"  end="\*/" contains=@Spell,javascriptCommentTodo

" JSDoc support start
if !exists("javascript_ignore_javaScriptdoc")
  syntax case ignore

  "" syntax coloring for javadoc comments (HTML)
  "syntax include @javaHtml <sfile>:p:h/html.vim
  "unlet b:current_syntax

  syntax region  javascriptDocComment         matchgroup=javascriptComment start="/\*\*"  end="\*/" contains=javascriptDocNotation,javascriptCommentTodo,javascriptCvsTag,@javascriptHtml,@Spell fold
  syntax match   javascriptDocNotation        contained "@" nextgroup=javascriptDocTags

  syntax keyword javascriptDocTags            contained constant constructor constrructs event function ignore inner private public static
  syntax keyword javascriptDocTags            contained const dict expose inheritDoc interface nosideeffects override protected struct
  syntax keyword javascriptDocTags            contained example

  syntax keyword javascriptDocTags            contained arguments lends memberOf name type link nextgroup=javascriptDocParam skipwhite

  syntax keyword javascriptDocTags            contained author class default deprecated description nextgroup=javascriptDocDesc skipwhite
  syntax keyword javascriptDocTags            contained fileOverview namespace requires since version nextgroup=javascriptDocDesc skipwhite
  syntax keyword javascriptDocTags            contained license preserve nextgroup=javascriptDocDesc skipwhite

  syntax keyword javascriptDocTags            contained borrows exports nextgroup=javascriptDocA skipwhite
  syntax keyword javascriptDocTags            contained param property nextgroup=javascriptDocNamedParamType,javascriptDocParamName skipwhite
  syntax keyword javascriptDocTags            contained define enum extends implements this typedef nextgroup=javascriptDocParamType skipwhite
  syntax keyword javascriptDocTags            contained returns throws nextgroup=javascriptDocParamType,javascriptDocParamName skipwhite
  syntax keyword javascriptDocTags            contained see nextgroup=javascriptDocRef skipwhite

  syntax match   javascriptDocNamedParamType  contained "{.\+}" nextgroup=javascriptDocParamName skipwhite
  syntax match   javascriptDocParamName       contained "\[\?\w\+\]\?" nextgroup=javascriptDocDesc skipwhite
  syntax match   javascriptDocParamType       contained "{.\+}" nextgroup=javascriptDocDesc skipwhite
  syntax match   javascriptDocA               contained "\%(#\|\w\|\.\|:\|\/\)\+" nextgroup=javascriptDocAs skipwhite
  syntax match   javascriptDocAs              contained "\s*as\s*" nextgroup=javascriptDocB skipwhite
  syntax match   javascriptDocB               contained "\%(#\|\w\|\.\|:\|\/\)\+"
  syntax match   javascriptDocParam           contained "\%(#\|\w\|\.\|:\|\/\)\+"
  syntax match   javascriptDocRef             contained "\%(#\|\w\|\.\|:\|\/\)\+"
  syntax region  javascriptDocLinkTag         contained matchgroup=javascriptDocLinkTag start="{" end="}" contains=javascriptDocTags

  syntax case match
endif

syntax case match

"Syntax in the JavaScript code
syntax region  javascriptString	               start=+"+  skip=+\\\\\|\\"+  end=+"\|$+
syntax region  javascriptString	               start=+'+  skip=+\\\\\|\\'+  end=+'\|$+
syntax region  javascriptTemplate              start=+`+  skip=+\\\\\|\\`+  end=+`\|$+	contains=javascriptTemplateSubstitution
syntax match   javascriptTemplateSubstitution  /\${\w\+}/

syntax match   javascriptNumber	               "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syntax match   javascriptFloat                 /\<-\=\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%([eE][+-]\=\d\+\)\=\>/
syntax region  javascriptRegexpString          start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gi]\{0,2\}\s*$+ end=+/[gi]\{0,2\}\s*[;.,)\]}]+me=e-1 oneline
" syntax match   javascriptLabel            /\(?\s*\)\@<!\<\w\+\(\s*:\)\@=/

"JavaScript Prototype
syntax keyword javascriptPrototype             prototype
                                              
"Program Keywords                             
syntax keyword javascriptSource                import export
syntax keyword javascriptIdentifier            arguments this let var const void
syntax keyword javascriptOperator              delete new instanceof typeof
syntax keyword javascriptBoolean               true false
syntax keyword javascriptNull                  null undefined
syntax keyword javascriptMessage               alert confirm prompt status
syntax keyword javascriptGlobal                self top parent
                                              
"Statement Keywords                           
syntax keyword javascriptConditional           if else switch
syntax keyword javascriptRepeat                do while for in of
syntax keyword javascriptBranch                break continue
syntax keyword javascriptLabel                 case default
syntax keyword javascriptStatement             return with yield
                                              
syntax keyword javascriptExceptions            try catch throw finally Error EvalError
syntax keyword javascriptExceptions            RangeError ReferenceError SyntaxError TypeError URIError
                                              
syntax keyword javascriptReserved              abstract enum int short boolean export
syntax keyword javascriptReserved              interface static byte extends long super
syntax keyword javascriptReserved              char final native synchronized class float
syntax keyword javascriptReserved              package throws const goto private transient
syntax keyword javascriptReserved              debugger implements protected volatile
syntax keyword javascriptReserved              double import public


"Web API
syntax keyword javascriptGlobal Object Function Boolean Symbol Error EvalError InternalError
syntax keyword javascriptGlobal RangeError ReferenceError StopIteration SyntaxError
syntax keyword javascriptGlobal TypeError URIError Number Math Date String RegExp
syntax keyword javascriptGlobal Array Float32Array Float64Array Int16Array Int32Array
syntax keyword javascriptGlobal Int8Array Uint16Array Uint32Array Uint8Array Uint8ClampedArray
syntax keyword javascriptGlobal ParallelArray Map Set WeakMap WeakSet ArrayBuffer
syntax keyword javascriptGlobal DataView JSON Iterator Generator Promise Reflect Proxy
syntax keyword javascriptGlobal Intl argumrnts
syntax keyword javascriptGlobalMethod eval uneval isFinite isNaN parseFloat parseInt
syntax keyword javascriptGlobalMethod decodeURI decodeURIComponent encodeURI encodeURIComponent

syntax keyword javascriptNodeGlobal global process console Buffer module expports
syntax keyword javascriptNodeGlobal setTimeout clearTimeout setInterval clearInterval

syntax keyword javascriptBOM contained AbstractWorker AnalyserNode App Apps ArrayBuffer
syntax keyword javascriptBOM contained ArrayBufferView Attr AudioBuffer AudioBufferSourceNode
syntax keyword javascriptBOM contained AudioContext AudioDestinationNode AudioListener
syntax keyword javascriptBOM contained AudioNode AudioParam BatteryManager BiquadFilterNode
syntax keyword javascriptBOM contained Blob BlobEvent BluetoothAdapter BluetoothDevice
syntax keyword javascriptBOM contained BluetoothManager CameraCapabilities CameraControl
syntax keyword javascriptBOM contained CameraManager CanvasGradient CanvasImageSource
syntax keyword javascriptBOM contained CanvasPattern CanvasRenderingContext2D CaretPosition
syntax keyword javascriptBOM contained CDATASection ChannelMergerNode ChannelSplitterNode
syntax keyword javascriptBOM contained CharacterData ChildNode ChromeWorker Comment
syntax keyword javascriptBOM contained Connection Console ContactManager Contacts
syntax keyword javascriptBOM contained ConvolverNode Coordinates CSS CSSConditionRule
syntax keyword javascriptBOM contained CSSGroupingRule CSSKeyframeRule CSSKeyframesRule
syntax keyword javascriptBOM contained CSSMediaRule CSSNamespaceRule CSSPageRule CSSRule
syntax keyword javascriptBOM contained CSSRuleList CSSStyleDeclaration CSSStyleRule
syntax keyword javascriptBOM contained CSSStyleSheet CSSSupportsRule DataTransfer
syntax keyword javascriptBOM contained DataView DedicatedWorkerGlobalScope DelayNode
syntax keyword javascriptBOM contained DeviceAcceleration DeviceRotationRate DeviceStorage
syntax keyword javascriptBOM contained DirectoryEntry DirectoryEntrySync DirectoryReader
syntax keyword javascriptBOM contained DirectoryReaderSync Document DocumentFragment
syntax keyword javascriptBOM contained DocumentTouch DocumentType DOMCursor DOMError
syntax keyword javascriptBOM contained DOMException DOMHighResTimeStamp DOMImplementation
syntax keyword javascriptBOM contained DOMImplementationRegistry DOMParser DOMRequest
syntax keyword javascriptBOM contained DOMString DOMStringList DOMStringMap DOMTimeStamp
syntax keyword javascriptBOM contained DOMTokenList DynamicsCompressorNode Element
syntax keyword javascriptBOM contained Entry EntrySync Extensions File FileEntry FileEntrySync
syntax keyword javascriptBOM contained FileException FileHandle FileList FileReader
syntax keyword javascriptBOM contained FileReaderSync FileRequest FileSystem FileSystemSync
syntax keyword javascriptBOM contained Float32Array Float64Array FMRadio FormData
syntax keyword javascriptBOM contained GainNode Gamepad GamepadButton Geolocation
syntax keyword javascriptBOM contained History HTMLAnchorElement HTMLAreaElement HTMLAudioElement
syntax keyword javascriptBOM contained HTMLBaseElement HTMLBodyElement HTMLBRElement
syntax keyword javascriptBOM contained HTMLButtonElement HTMLCanvasElement HTMLCollection
syntax keyword javascriptBOM contained HTMLDataElement HTMLDataListElement HTMLDivElement
syntax keyword javascriptBOM contained HTMLDListElement HTMLDocument HTMLElement HTMLEmbedElement
syntax keyword javascriptBOM contained HTMLFieldSetElement HTMLFormControlsCollection
syntax keyword javascriptBOM contained HTMLFormElement HTMLHeadElement HTMLHeadingElement
syntax keyword javascriptBOM contained HTMLHRElement HTMLHtmlElement HTMLIFrameElement
syntax keyword javascriptBOM contained HTMLImageElement HTMLInputElement HTMLKeygenElement
syntax keyword javascriptBOM contained HTMLLabelElement HTMLLegendElement HTMLLIElement
syntax keyword javascriptBOM contained HTMLLinkElement HTMLMapElement HTMLMediaElement
syntax keyword javascriptBOM contained HTMLMetaElement HTMLMeterElement HTMLModElement
syntax keyword javascriptBOM contained HTMLObjectElement HTMLOListElement HTMLOptGroupElement
syntax keyword javascriptBOM contained HTMLOptionElement HTMLOptionsCollection HTMLOutputElement
syntax keyword javascriptBOM contained HTMLParagraphElement HTMLParamElement HTMLPreElement
syntax keyword javascriptBOM contained HTMLProgressElement HTMLQuoteElement HTMLScriptElement
syntax keyword javascriptBOM contained HTMLSelectElement HTMLSourceElement HTMLSpanElement
syntax keyword javascriptBOM contained HTMLStyleElement HTMLTableCaptionElement HTMLTableCellElement
syntax keyword javascriptBOM contained HTMLTableColElement HTMLTableDataCellElement
syntax keyword javascriptBOM contained HTMLTableElement HTMLTableHeaderCellElement
syntax keyword javascriptBOM contained HTMLTableRowElement HTMLTableSectionElement
syntax keyword javascriptBOM contained HTMLTextAreaElement HTMLTimeElement HTMLTitleElement
syntax keyword javascriptBOM contained HTMLTrackElement HTMLUListElement HTMLUnknownElement
syntax keyword javascriptBOM contained HTMLVideoElement IDBCursor IDBCursorSync IDBCursorWithValue
syntax keyword javascriptBOM contained IDBDatabase IDBDatabaseSync IDBEnvironment
syntax keyword javascriptBOM contained IDBEnvironmentSync IDBFactory IDBFactorySync
syntax keyword javascriptBOM contained IDBIndex IDBIndexSync IDBKeyRange IDBObjectStore
syntax keyword javascriptBOM contained IDBObjectStoreSync IDBOpenDBRequest IDBRequest
syntax keyword javascriptBOM contained IDBTransaction IDBTransactionSync IDBVersionChangeEvent
syntax keyword javascriptBOM contained ImageData IndexedDB Int16Array Int32Array Int8Array
syntax keyword javascriptBOM contained L10n LinkStyle LocalFileSystem LocalFileSystemSync
syntax keyword javascriptBOM contained Location LockedFile MediaQueryList MediaQueryListListener
syntax keyword javascriptBOM contained MediaRecorder MediaSource MediaStream MediaStreamTrack
syntax keyword javascriptBOM contained MutationObserver Navigator NavigatorGeolocation
syntax keyword javascriptBOM contained NavigatorID NavigatorLanguage NavigatorOnLine
syntax keyword javascriptBOM contained NavigatorPlugins NetworkInformation Node NodeFilter
syntax keyword javascriptBOM contained NodeIterator NodeList Notification OfflineAudioContext
syntax keyword javascriptBOM contained OscillatorNode PannerNode ParentNode Performance
syntax keyword javascriptBOM contained PerformanceNavigation PerformanceTiming Permissions
syntax keyword javascriptBOM contained PermissionSettings Plugin PluginArray Position
syntax keyword javascriptBOM contained PositionError PositionOptions PowerManager
syntax keyword javascriptBOM contained ProcessingInstruction PromiseResolver PushManager
syntax keyword javascriptBOM contained Range RTCConfiguration RTCPeerConnection RTCPeerConnectionErrorCallback
syntax keyword javascriptBOM contained RTCSessionDescription RTCSessionDescriptionCallback
syntax keyword javascriptBOM contained ScriptProcessorNode Selection SettingsLock
syntax keyword javascriptBOM contained SettingsManager SharedWorker StyleSheet StyleSheetList
syntax keyword javascriptBOM contained SVGAElement SVGAngle SVGAnimateColorElement
syntax keyword javascriptBOM contained SVGAnimatedAngle SVGAnimatedBoolean SVGAnimatedEnumeration
syntax keyword javascriptBOM contained SVGAnimatedInteger SVGAnimatedLength SVGAnimatedLengthList
syntax keyword javascriptBOM contained SVGAnimatedNumber SVGAnimatedNumberList SVGAnimatedPoints
syntax keyword javascriptBOM contained SVGAnimatedPreserveAspectRatio SVGAnimatedRect
syntax keyword javascriptBOM contained SVGAnimatedString SVGAnimatedTransformList
syntax keyword javascriptBOM contained SVGAnimateElement SVGAnimateMotionElement SVGAnimateTransformElement
syntax keyword javascriptBOM contained SVGAnimationElement SVGCircleElement SVGClipPathElement
syntax keyword javascriptBOM contained SVGCursorElement SVGDefsElement SVGDescElement
syntax keyword javascriptBOM contained SVGElement SVGEllipseElement SVGFilterElement
syntax keyword javascriptBOM contained SVGFontElement SVGFontFaceElement SVGFontFaceFormatElement
syntax keyword javascriptBOM contained SVGFontFaceNameElement SVGFontFaceSrcElement
syntax keyword javascriptBOM contained SVGFontFaceUriElement SVGForeignObjectElement
syntax keyword javascriptBOM contained SVGGElement SVGGlyphElement SVGGradientElement
syntax keyword javascriptBOM contained SVGHKernElement SVGImageElement SVGLength SVGLengthList
syntax keyword javascriptBOM contained SVGLinearGradientElement SVGLineElement SVGMaskElement
syntax keyword javascriptBOM contained SVGMatrix SVGMissingGlyphElement SVGMPathElement
syntax keyword javascriptBOM contained SVGNumber SVGNumberList SVGPathElement SVGPatternElement
syntax keyword javascriptBOM contained SVGPoint SVGPolygonElement SVGPolylineElement
syntax keyword javascriptBOM contained SVGPreserveAspectRatio SVGRadialGradientElement
syntax keyword javascriptBOM contained SVGRect SVGRectElement SVGScriptElement SVGSetElement
syntax keyword javascriptBOM contained SVGStopElement SVGStringList SVGStylable SVGStyleElement
syntax keyword javascriptBOM contained SVGSVGElement SVGSwitchElement SVGSymbolElement
syntax keyword javascriptBOM contained SVGTests SVGTextElement SVGTextPositioningElement
syntax keyword javascriptBOM contained SVGTitleElement SVGTransform SVGTransformable
syntax keyword javascriptBOM contained SVGTransformList SVGTRefElement SVGTSpanElement
syntax keyword javascriptBOM contained SVGUseElement SVGViewElement SVGVKernElement
syntax keyword javascriptBOM contained TCPServerSocket TCPSocket Telephony TelephonyCall
syntax keyword javascriptBOM contained Text TextDecoder TextEncoder TextMetrics TimeRanges
syntax keyword javascriptBOM contained Touch TouchList Transferable TreeWalker Uint16Array
syntax keyword javascriptBOM contained Uint32Array Uint8Array Uint8ClampedArray URL
syntax keyword javascriptBOM contained URLSearchParams URLUtils URLUtilsReadOnly UserProximityEvent
syntax keyword javascriptBOM contained ValidityState VideoPlaybackQuality WaveShaperNode
syntax keyword javascriptBOM contained WebBluetooth WebGLRenderingContext WebSMS WebSocket
syntax keyword javascriptBOM contained WebVTT WifiManager Window Worker WorkerConsole
syntax keyword javascriptBOM contained WorkerLocation WorkerNavigator XDomainRequest
syntax keyword javascriptBOM contained XMLDocument XMLHttpRequest XMLHttpRequestEventTarget

syntax keyword javascriptBOMWindowProp applicationCache closed Components console
syntax keyword javascriptBOMWindowProp controllers crypto dialogArguments document
syntax keyword javascriptBOMWindowProp frameElement frames fullScreen history innerHeight
syntax keyword javascriptBOMWindowProp innerWidth length location locationbar localStorage
syntax keyword javascriptBOMWindowProp menubar messageManager name navigator opener
syntax keyword javascriptBOMWindowProp outerHeight outerWidth pageXOffset pageYOffset
syntax keyword javascriptBOMWindowProp parent performance personalbar returnValue
syntax keyword javascriptBOMWindowProp screen screenX screenY scrollbars scrollMaxX
syntax keyword javascriptBOMWindowProp scrollMaxY scrollX scrollY self sessionStorage
syntax keyword javascriptBOMWindowProp sidebar status statusbar toolbar top window
syntax keyword javascriptBOMWindowMethod alert atob blur btoa clearImmediate clearInterval
syntax keyword javascriptBOMWindowMethod clearTimeout close confirm dispatchEvent
syntax keyword javascriptBOMWindowMethod dump find focus getAttention getAttentionWithCycleCount
syntax keyword javascriptBOMWindowMethod getComputedStyle getDefaulComputedStyle getSelection
syntax keyword javascriptBOMWindowMethod matchMedia maximize moveBy moveTo open openDialog
syntax keyword javascriptBOMWindowMethod postMessage print prompt removeEventListener
syntax keyword javascriptBOMWindowMethod resizeBy resizeTo restore scroll scrollBy
syntax keyword javascriptBOMWindowMethod scrollByLines scrollByPages scrollTo setCursor
syntax keyword javascriptBOMWindowMethod setImmediate setInterval setResizable setTimeout
syntax keyword javascriptBOMWindowMethod showModalDialog sizeToContent stop updateCommands
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
syntax keyword javascriptBOMWindowCons DOMParser QueryInterface XMLSerializer

syntax keyword javascriptBOMNavigatorProp contained battery buildID cookieEnabled
syntax keyword javascriptBOMNavigatorProp contained doNotTrack maxTouchPoints oscpu
syntax keyword javascriptBOMNavigatorProp contained productSub push vendor vendorSub
syntax keyword javascriptBOMNavigatorMethod contained addIdleObserver getDeviceStorage
syntax keyword javascriptBOMNavigatorMethod contained getDeviceStorages getGamepads
syntax keyword javascriptBOMNavigatorMethod contained getUserMedia registerContentHandler
syntax keyword javascriptBOMNavigatorMethod contained removeIdleObserver requestWakeLock
syntax keyword javascriptBOMNavigatorMethod contained vibrate watch registerProtocolHandler

syntax keyword javascriptDOMNodeProp contained attributes baseURI baseURIObject childNodes
syntax keyword javascriptDOMNodeProp contained firstChild lastChild localName namespaceURI
syntax keyword javascriptDOMNodeProp contained nextSibling nodeName nodePrincipal
syntax keyword javascriptDOMNodeProp contained nodeType nodeValue ownerDocument parentElement
syntax keyword javascriptDOMNodeProp contained parentNode prefix previousSibling textContent
syntax keyword javascriptDOMNodeMethod contained appendChild cloneNode compareDocumentPosition
" syntax keyword javascriptDOMNodeMethod contained contains getUserData hasAttributes
syntax keyword javascriptDOMNodeMethod contained getUserData hasAttributes
syntax keyword javascriptDOMNodeMethod contained hasChildNodes insertBefore isDefaultNamespace
syntax keyword javascriptDOMNodeMethod contained isEqualNode isSameNode isSupported
syntax keyword javascriptDOMNodeMethod contained lookupNamespaceURI lookupPrefix normalize
syntax keyword javascriptDOMNodeMethod contained removeChild replaceChild setUserData
syntax keyword javascriptDOMNodeType contained ELEMENT_NODE ATTRIBUTE_NODE TEXT_NODE
syntax keyword javascriptDOMNodeType contained CDATA_SECTION_NODEN_NODE ENTITY_REFERENCE_NODE
syntax keyword javascriptDOMNodeType contained ENTITY_NODE PROCESSING_INSTRUCTION_NODEN_NODE
syntax keyword javascriptDOMNodeType contained COMMENT_NODE DOCUMENT_NODE DOCUMENT_TYPE_NODE
syntax keyword javascriptDOMNodeType contained DOCUMENT_FRAGMENT_NODE NOTATION_NODE

syntax keyword javascriptDOMElemProp contained accessKey clientHeight clientLeft clientTop
syntax keyword javascriptDOMElemProp contained clientWidth id innerHTML length onafterscriptexecute
syntax keyword javascriptDOMElemProp contained onbeforescriptexecute oncopy oncut
syntax keyword javascriptDOMElemProp contained onpaste onwheel scrollHeight scrollLeft
syntax keyword javascriptDOMElemProp contained scrollTop scrollWidth tagName classList
syntax keyword javascriptDOMElemProp contained className name outerHTML style
syntax keyword javascriptDOMElemMethod contained getAttributeNS getAttributeNode getAttributeNodeNS
syntax keyword javascriptDOMElemMethod contained getBoundingClientRect getClientRects
syntax keyword javascriptDOMElemMethod contained getElementsByClassName getElementsByTagName
syntax keyword javascriptDOMElemMethod contained getElementsByTagNameNS hasAttribute
syntax keyword javascriptDOMElemMethod contained hasAttributeNS insertAdjacentHTML
syntax keyword javascriptDOMElemMethod contained matches querySelector querySelectorAll
syntax keyword javascriptDOMElemMethod contained removeAttribute removeAttributeNS
syntax keyword javascriptDOMElemMethod contained removeAttributeNode requestFullscreen
syntax keyword javascriptDOMElemMethod contained requestPointerLock scrollIntoView
syntax keyword javascriptDOMElemMethod contained setAttribute setAttributeNS setAttributeNode
syntax keyword javascriptDOMElemMethod contained setAttributeNodeNS setCapture supports
syntax keyword javascriptDOMElemMethod contained getAttribute

syntax keyword javascriptDOMEventTargetMethod contained addEventListener removeEventListener
syntax keyword javascriptDOMEventTargetMethod contained dispatchEvent
syntax keyword javascriptDOMEventCons AnimationEvent AudioProcessingEvent BeforeInputEvent
syntax keyword javascriptDOMEventCons BeforeUnloadEvent BlobEvent ClipboardEvent CloseEvent
syntax keyword javascriptDOMEventCons CompositionEvent CSSFontFaceLoadEvent CustomEvent
syntax keyword javascriptDOMEventCons DeviceLightEvent DeviceMotionEvent DeviceOrientationEvent
syntax keyword javascriptDOMEventCons DeviceProximityEvent DOMTransactionEvent DragEvent
syntax keyword javascriptDOMEventCons EditingBeforeInputEvent ErrorEvent FocusEvent
syntax keyword javascriptDOMEventCons GamepadEvent HashChangeEvent IDBVersionChangeEvent
syntax keyword javascriptDOMEventCons KeyboardEvent MediaStreamEvent MessageEvent
syntax keyword javascriptDOMEventCons MouseEvent MutationEvent OfflineAudioCompletionEvent
syntax keyword javascriptDOMEventCons PageTransitionEvent PointerEvent PopStateEvent
syntax keyword javascriptDOMEventCons ProgressEvent RelatedEvent RTCPeerConnectionIceEvent
syntax keyword javascriptDOMEventCons SensorEvent StorageEvent SVGEvent SVGZoomEvent
syntax keyword javascriptDOMEventCons TimeEvent TouchEvent TrackEvent TransitionEvent
syntax keyword javascriptDOMEventCons UIEvent UserProximityEvent WheelEvent
syntax keyword javascriptDOMEventProp contained bubbles cancelable currentTarget defaultPrevented
syntax keyword javascriptDOMEventProp contained eventPhase target timeStamp type isTrusted
syntax keyword javascriptDOMEventMethod contained initEvent preventDefault stopImmediatePropagation
syntax keyword javascriptDOMEventMethod contained stopPropagation

syntax match javascriptDOMNodeMethod contained /contains/
"Style
" if exists("javascript_enable_domcss")
  syntax keyword javascriptDOMStyle contained alignContent alignItems alignSelf animation
  syntax keyword javascriptDOMStyle contained animationDelay animationDirection animationDuration
  syntax keyword javascriptDOMStyle contained animationFillMode animationIterationCount
  syntax keyword javascriptDOMStyle contained animationName animationPlayState animationTimingFunction
  syntax keyword javascriptDOMStyle contained backfaceVisibility background backgroundAttachment
  syntax keyword javascriptDOMStyle contained backgroundBlendMode backgroundClip backgroundColor
  syntax keyword javascriptDOMStyle contained backgroundImage backgroundOrigin backgroundPosition
  syntax keyword javascriptDOMStyle contained backgroundRepeat backgroundSize border
  syntax keyword javascriptDOMStyle contained borderBottom borderBottomColor borderBottomLeftRadius
  syntax keyword javascriptDOMStyle contained borderBottomRightRadius borderBottomStyle
  syntax keyword javascriptDOMStyle contained borderBottomWidth borderCollapse borderColor
  syntax keyword javascriptDOMStyle contained borderImage borderImageOutset borderImageRepeat
  syntax keyword javascriptDOMStyle contained borderImageSlice borderImageSource borderImageWidth
  syntax keyword javascriptDOMStyle contained borderLeft borderLeftColor borderLeftStyle
  syntax keyword javascriptDOMStyle contained borderLeftWidth borderRadius borderRight
  syntax keyword javascriptDOMStyle contained borderRightColor borderRightStyle borderRightWidth
  syntax keyword javascriptDOMStyle contained borderSpacing borderStyle borderTop borderTopColor
  syntax keyword javascriptDOMStyle contained borderTopLeftRadius borderTopRightRadius
  syntax keyword javascriptDOMStyle contained borderTopStyle borderTopWidth borderWidth
  syntax keyword javascriptDOMStyle contained bottom boxDecorationBreak boxShadow boxSizing
  syntax keyword javascriptDOMStyle contained breakAfter breakBefore breakInside captionSide
  syntax keyword javascriptDOMStyle contained clear clip clipPath color columns columnCount
  syntax keyword javascriptDOMStyle contained columnFill columnGap columnRule columnRuleColor
  syntax keyword javascriptDOMStyle contained columnRuleStyle columnRuleWidth columnSpan
  syntax keyword javascriptDOMStyle contained columnWidth content counterIncrement counterReset
  syntax keyword javascriptDOMStyle contained cursor direction display emptyCells flex
  syntax keyword javascriptDOMStyle contained flexBasis flexDirection flexFlow flexGrow
  syntax keyword javascriptDOMStyle contained flexShrink flexWrap float font fontFamily
  syntax keyword javascriptDOMStyle contained fontFeatureSettings fontKerning fontLanguageOverride
  syntax keyword javascriptDOMStyle contained fontSize fontSizeAdjust fontStretch fontStyle
  syntax keyword javascriptDOMStyle contained fontSynthesis fontVariant fontVariantAlternates
  syntax keyword javascriptDOMStyle contained fontVariantCaps fontVariantEastAsian fontVariantLigatures
  syntax keyword javascriptDOMStyle contained fontVariantNumeric fontVariantPosition
  syntax keyword javascriptDOMStyle contained fontWeight grad grid gridArea gridAutoColumns
  syntax keyword javascriptDOMStyle contained gridAutoFlow gridAutoPosition gridAutoRows
  syntax keyword javascriptDOMStyle contained gridColumn gridColumnStart gridColumnEnd
  syntax keyword javascriptDOMStyle contained gridRow gridRowStart gridRowEnd gridTemplate
  syntax keyword javascriptDOMStyle contained gridTemplateAreas gridTemplateRows gridTemplateColumns
  syntax keyword javascriptDOMStyle contained height hyphens imageRendering imageResolution
  syntax keyword javascriptDOMStyle contained imageOrientation imeMode inherit justifyContent
  syntax keyword javascriptDOMStyle contained left letterSpacing lineBreak lineHeight
  syntax keyword javascriptDOMStyle contained listStyle listStyleImage listStylePosition
  syntax keyword javascriptDOMStyle contained listStyleType margin marginBottom marginLeft
  syntax keyword javascriptDOMStyle contained marginRight marginTop marks mask maskType
  syntax keyword javascriptDOMStyle contained maxHeight maxWidth minHeight minWidth
  syntax keyword javascriptDOMStyle contained mixBlendMode objectFit objectPosition
  syntax keyword javascriptDOMStyle contained opacity order orphans outline outlineColor
  syntax keyword javascriptDOMStyle contained outlineOffset outlineStyle outlineWidth
  syntax keyword javascriptDOMStyle contained overflow overflowWrap overflowX overflowY
  syntax keyword javascriptDOMStyle contained overflowClipBox padding paddingBottom
  syntax keyword javascriptDOMStyle contained paddingLeft paddingRight paddingTop pageBreakAfter
  syntax keyword javascriptDOMStyle contained pageBreakBefore pageBreakInside perspective
  syntax keyword javascriptDOMStyle contained perspectiveOrigin pointerEvents position
  syntax keyword javascriptDOMStyle contained quotes resize right shapeImageThreshold
  syntax keyword javascriptDOMStyle contained shapeMargin shapeOutside tableLayout tabSize
  syntax keyword javascriptDOMStyle contained textAlign textAlignLast textCombineHorizontal
  syntax keyword javascriptDOMStyle contained textDecoration textDecorationColor textDecorationLine
  syntax keyword javascriptDOMStyle contained textDecorationStyle textIndent textOrientation
  syntax keyword javascriptDOMStyle contained textOverflow textRendering textShadow
  syntax keyword javascriptDOMStyle contained textTransform textUnderlinePosition top
  syntax keyword javascriptDOMStyle contained touchAction transform transformOrigin
  syntax keyword javascriptDOMStyle contained transformStyle transition transitionDelay
  syntax keyword javascriptDOMStyle contained transitionDuration transitionProperty
  syntax keyword javascriptDOMStyle contained transitionTimingFunction unicodeBidi unicodeRange
  syntax keyword javascriptDOMStyle contained verticalAlign visibility whiteSpace width
  syntax keyword javascriptDOMStyle contained willChange wordBreak wordSpacing wordWrap
  syntax keyword javascriptDOMStyle contained writingMode zIndex
" endif

syntax cluster props                    contains=javascriptPrototype,javascriptBOMWindowProp,javascriptBOMWindowMethod,javascriptBOMWindowEvent,javascriptBOMNavigatorProp,javascriptDOMNodeProp,javascriptDOMNodeMethod,javascriptDOMNodeType,javascriptDOMElemProp,javascriptDOMElemMethod,javascriptDOMEventTargetMethod,javascriptDOMEventProp,javascriptDOMEventMethod,

syntax match javascriptDotNotation      "\." nextgroup=@props
syntax match javascriptDotStyleNotation "\.style\." nextgroup=javascriptDOMStyle transparent

if main_syntax == "javascript"
  syntax sync clear
  syntax sync ccomment javascriptComment minlines=200
  " syntax sync match javascriptHighlight grouphere javascriptBlock /{/
endif

syntax keyword javascriptFuncKeyword  contained function
syntax region  javascriptFuncDef      start="function" end="\([^)]*\)" contains=javascriptFuncKeyword,javascriptFuncArg keepend
syntax match   javascriptFuncArg      contained "\(([^()]*)\)" contains=javascriptParens,javascriptFuncComma
syntax match   javascriptFuncComma    contained /,/
" syntax region  javascriptFuncBlock      contained matchgroup=javascriptFuncBlock start="{" end="}" contains=@javascriptAll,javascriptParensErrA,javascriptParensErrB,javascriptParen,javascriptBracket,javascriptBlock fold
syntax match   javascriptArrowFunc    /=>/

syntax region  javaScriptParen        contained start="(" end=")" 
syntax match   javascriptBraces	      "[{}\[\]]"
syntax match   javascriptParens	      "[()]"
syntax match   javascriptOpSymbols	  "\_[ \_^]\zs\(=\{1,3}\|!==\|!=\|<\|>\|>=\|<=\|++\|+=\|--\|-=\)\ze\_[ \_$]"
syntax match   javascriptEndColons    "[;,]"
syntax match   javascriptLogicSymbols "\(&&\)\|\(||\)"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_javascript_syn_inits")
  if version < 508
    let did_javascript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink javascriptEndColons            Exception
  HiLink javascriptOpSymbols            Operator
  HiLink javascriptLogicSymbols         Boolean
  HiLink javascriptBraces               Function
  HiLink javascriptParens               Operator
  HiLink javascriptComment              Comment
  HiLink javascriptLineComment          Comment
  HiLink javascriptDocComment           Comment
  HiLink javascriptCommentTodo          Todo
  HiLink javascriptCvsTag               Function
  HiLink javascriptDocNotation          Special
  HiLink javascriptDocTags              Special
  " HiLink javascriptDocSeeTag            Function
  HiLink javascriptDocParam             Function
  HiLink javascriptDocNamedParamType    Type
  HiLink javascriptDocParamName         Type
  HiLink javascriptDocParamType         Type
  HiLink javascriptString               String
  HiLink javascriptTemplate             String
  HiLink javascriptTemplateSubstitution Label
  HiLink javascriptRegexpString         String
  " HiLink javascriptGlobal               Constant
  " HiLink javascriptCharacter            Character
  HiLink javascriptPrototype            Type
  HiLink javascriptConditional          Conditional
  HiLink javascriptBranch               Conditional
  HiLink javascriptIdentifier           Identifier
  HiLink javascriptRepeat               Repeat
  HiLink javascriptStatement            Statement
  HiLink javascriptFuncKeyword          Function
  HiLink javascriptArrowFunc            Function
  HiLink javascriptMessage              Keyword
  HiLink javascriptReserved             Keyword
  HiLink javascriptOperator             Operator
  HiLink javascriptType                 Type
  HiLink javascriptNull                 Type
  HiLink javascriptNumber               Number
  HiLink javascriptFloat                Number
  HiLink javascriptBoolean              Boolean
  HiLink javascriptLabel                Label
  HiLink javascriptSpecial              Special
  HiLink javascriptSource               Special
  HiLink javascriptExceptions           Special

  HiLink javascriptGlobal               Constant
  HiLink javascriptNodeGlobal           Constant
  HiLink javascriptBOM                  Constant
  HiLink javascriptGlobalMethod         Constant
  HiLink javascriptBOMWindowCons        Constant
  HiLink javascriptDOMEventCons         Constant
  HiLink javascriptBOMWindowProp        Type
  HiLink javascriptBOMWindowMethod      Type
  HiLink javascriptBOMWindowEvent       Type
  HiLink javascriptBOMNavigatorProp     Type
  HiLink javascriptBOMNavigatorMethod   Type
  HiLink javascriptDOMNodeProp          Type
  HiLink javascriptDOMNodeMethod        Type
  HiLink javascriptDOMNodeType          Type
  HiLink javascriptDOMElemProp          Type
  HiLink javascriptDOMElemMethod        Type
  HiLink javascriptDOMEventTargetMethod Type
  HiLink javascriptDOMEventProp         Type
  HiLink javascriptDOMEventMethod       Type
  HiLink javascriptDOMStyle             Type
                                        
  HiLink javascriptFuncDef              Title
  HiLink javascriptFuncArg              Special
  HiLink javascriptFuncComma            Operator  
                                        
  HiLink shellbang                      Comment

  delcommand HiLink
endif

let b:current_syntax = "javascript"
if main_syntax == 'javascript'
  unlet main_syntax
endif

