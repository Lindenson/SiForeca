(function(){"use strict";var e={1705:function(e,t,n){var r=n(6166),s=n.n(r);const a=location.protocol+"//"+location.host,o="https://scholar.googleusercontent.com/citations?view_op=view_photo&user=nKNZLU4AAAAJ&citpid=1",i="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQ5t9tNcC1mDp3SZSZNJe7g6aGa38PeE27-ZYMR9PcEHvUlM3p83oyTw1EwO06Nwbx4fA&usqp=CAU",l=["Admin"],c={username:"siforeca@gmail.com",avatarUrl:i};t["Z"]={_user:c,storage:null,loggedIn(e){return this.storage||(this.storage=e),this.storage.getters.getLogged},filterMenuForUserRole(e,t){return this.loggedIn(e)?t:t.filter((e=>!l.includes(e.role)))},async logIn(e,t,n){return s().post(a+"/user/signin?username="+e+"&password="+t,{}).then((t=>t.data.length<100?(n.dispatch("setToken",""),{isOk:!1,message:"Authentication failed"}):(n.dispatch("setToken",t.data),n.commit("SET_LOGGED",!0),this._user={username:e,avatarUrl:i},{isOk:!0,data:this._user}))).catch((()=>(n.dispatch("setToken",""),{isOk:!1,message:"Authentication failed"})))},async logOut(e){let t=e.getters.getToken;return this._user=c,e.commit("SET_LOGGED",!1),e.dispatch("setToken",""),s().get(a+"/user/logout",{headers:{Authorization:"Bearer "+t}}).then((()=>({isOk:!0}))).catch((()=>({isOk:!1})))},async getUser(e){if(!this.loggedIn(e))return new Promise((e=>{e({isOk:!0,data:c})}));let t=e.getters.getToken;return s().get(a+"/user/whoami",{headers:{Authorization:"Bearer "+t}}).then((e=>({isOk:!0,data:{username:e.data.username,avatarUrl:o}}))).catch((()=>({isOk:!1,data:c})))},async resetPassword(e){return s().post(a+"/user/reset?email="+e,{}).then((()=>({isOk:!0,message:"E-mail was sent for confirmation"}))).catch((e=>(console.log(e.response.status),{isOk:!1,message:e.response.data})))},async changePassword(e,t){let n=t.substr(t.indexOf("=")+1);return s().post(a+"/user/change?token="+n+"&password="+e,{}).then((()=>({isOk:!0,message:"Password changed successfully"}))).catch((e=>(console.log(e.response.status),{isOk:!1,message:e.response.data})))},async createAccount(e,t){return s().post(a+"/user/signup?username="+e+"&password="+t,{}).then((e=>(console.log(e.statusText),{isOk:!0,message:"E-mail was sent for confirmation"}))).catch((e=>(console.log(e.response.status),{isOk:!1,message:e.response.data})))}}},6897:function(e,t,n){var r=n(8935),s=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{attrs:{id:"root"}},[n("div",{class:e.cssClasses},[n("router-view",{attrs:{name:"layout",title:e.title,"is-x-small":e.screen.isXSmall,"is-large":e.screen.isLarge},on:{mounted:e.childMounted},scopedSlots:e._u([{key:"footer",fn:function(){return[n("app-footer")]},proxy:!0}])},[n("div",{staticClass:"content"},[n("router-view",{attrs:{name:"content"}})],1)])],1)])},a=[],o=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"content-block"},[n("footer",{staticClass:"footer"},[e._v(" Copyright © 2011-"+e._s((new Date).getFullYear())+" "+e._s(this.$appInfo.title)+" Inc. "),n("br"),e._v("All trademarks or registered trademarks are property of their respective owners. ")])])},i=[],l=n(1001),c={},u=(0,l.Z)(c,o,i,!1,null,null,null),d=u.exports;const m={XSmall:"(max-width: 599.99px)",Small:"(min-width: 600px) and (max-width: 959.99px)",Medium:"(min-width: 960px) and (max-width: 1279.99px)",Large:"(min-width: 1280px)"};let h=[],p=window.matchMedia(m.XSmall),f=window.matchMedia(m.Small),g=window.matchMedia(m.Medium),x=window.matchMedia(m.Large);[p,f,g,x].forEach((e=>{e.addEventListener("change",(()=>{h.forEach((e=>e()))}))}));const y=()=>({"screen-x-small":p.matches,"screen-small":f.matches,"screen-medium":g.matches,"screen-large":x.matches}),v=e=>h.push(e),b=e=>{h=h.filter((t=>t!==e))};function D(){const e=y();return{isXSmall:e["screen-x-small"],isLarge:e["screen-large"],cssClasses:Object.keys(e).filter((t=>e[t]))}}var w={name:"app",data(){return{title:this.$appInfo.title,screen:D()}},computed:{cssClasses(){return["app"].concat(this.screen.cssClasses)}},methods:{screenSizeChanged(){this.screen=D()},childMounted:function(){setTimeout((()=>{document.cm0.forEach((e=>{e.render()}))}),40)}},mounted(){v(this.screenSizeChanged)},beforeDestroy(){b(this.screenSizeChanged)},components:{AppFooter:d}},C=w,k=(0,l.Z)(C,s,a,!1,null,null,null),S=k.exports,_=n(2809),O=n(1705),E=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"content-block"},[n("h2",[e._v("Dashboard")]),n("div",{staticClass:"container-fluid"},[n("div",{staticClass:"row"},[n("div",{staticClass:"col-xl-4 col-md-6 forgra justify-content-center"},[n("graph-my",{ref:e.helper1})],1),n("div",{staticClass:"col-xl-4 col-md-6 forgra justify-content-center"},[n("gauge-my",{ref:e.helper0})],1),n("div",{staticClass:"col-xl-4 col-md-6 forgra justify-content-center"},[n("chart-my",{ref:e.helper2})],1)]),n("div",{staticClass:"row"},[n("div",{staticClass:"col-xl-4 col-md-6 forgra justify-content-center"},[n("chart-my",{ref:e.helper22})],1),n("div",{staticClass:"col-xl-4 col-md-6 forgra justify-content-center"},[n("graph-my",{ref:e.helper11})],1),n("div",{staticClass:"col-xl-4 col-md-6 forgra justify-content-center"},[n("gauge-my",{ref:e.helper00})],1)])])])},T=[],A=n(3009),$=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("DxChart",{ref:e.ch11,attrs:{id:"graph","data-source":e.dataSource,palette:"Harmony Light",title:"Taxation"}},[n("DxCommonSeriesSettings",{attrs:{type:e.type,"argument-field":"country"}}),n("DxSeries",{attrs:{"value-field":"y1564",name:"15-64 years"}}),n("DxSeries",{attrs:{"value-field":"y014",name:"0-14 years"}}),n("DxSeries",{attrs:{"value-field":"y65",name:"65 years and older"}}),n("DxMargin",{attrs:{bottom:20}}),n("DxArgumentAxis",{attrs:{"value-margins-enabled":!1}}),n("DxLegend",{attrs:{"vertical-alignment":"bottom","horizontal-alignment":"center"}}),n("DxExport",{attrs:{enabled:!1}})],1)},L=[],M=n(4677),P=n.n(M);const I=[{country:"China",y014:233866959,y1564:1170914102,y65:171774113},{country:"India",y014:373419115,y1564:882520945,y65:76063757},{country:"United States",y014:60554755,y1564:213172625,y65:54835293},{country:"Indonesia",y014:65715705,y1564:177014815,y65:18053690},{country:"Brazil",y014:45278034,y1564:144391494,y65:17190842},{country:"Russia",y014:24465156,y1564:96123777,y65:20412243}],Z="ch-ch11";var B={components:{DxChart:M.DxChart,DxSeries:M.DxSeries,DxArgumentAxis:M.DxArgumentAxis,DxCommonSeriesSettings:M.DxCommonSeriesSettings,DxExport:M.DxExport,DxLegend:M.DxLegend,DxMargin:M.DxMargin},data(){const e=["area","stackedarea","fullstackedarea"];return{dataSource:I,types:e,type:e[0],ch11:Z}}},V=B,j=(0,l.Z)(V,$,L,!1,null,null,null),z=j.exports,q=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("DxPieChart",{ref:e.ch22,attrs:{id:"pie","data-source":e.areas,palette:"Bright",title:"Population"},on:{"point-click":function(t){return e.pointClickHandler(t)},"legend-click":function(t){return e.legendClickHandler(t)}}},[n("DxSeries",{attrs:{"argument-field":"country","value-field":"area"}},[n("DxLabel",{attrs:{visible:!0}},[n("DxConnector",{attrs:{visible:!0,width:1}})],1)],1),n("DxSize"),n("DxExport",{attrs:{enabled:!1}})],1)},U=[],G=n(6549),F=n.n(G);const N=[{country:"Russia",area:12},{country:"Canada",area:7},{country:"USA",area:7},{country:"China",area:7},{country:"Brazil",area:6},{country:"Australia",area:5},{country:"India",area:2},{country:"Others",area:55}],R="ch-ch22";var H={components:{DxPieChart:F(),DxSize:G.DxSize,DxSeries:G.DxSeries,DxLabel:G.DxLabel,DxConnector:G.DxConnector,DxExport:G.DxExport},data(){return{areas:N,ch22:R}},methods:{pointClickHandler(e){this.toggleVisibility(e.target)},legendClickHandler(e){const t=e.target,n=e.component.getAllSeries()[0].getPointsByArg(t)[0];this.toggleVisibility(n)},toggleVisibility(e){e.isVisible()?e.hide():e.show()}}},X=H,J=(0,l.Z)(X,q,U,!1,null,null,null),K=J.exports,Y=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("DxBarGauge",{ref:e.ch00,attrs:{id:"gauge","start-value":0,"end-value":100,values:e.values}},[n("DxLabel",{attrs:{indent:30,format:e.format,"customize-text":e.customizeText}}),n("DxExport",{attrs:{enabled:!1}}),n("DxTitle",{attrs:{text:"Inflation"}},[n("DxFont",{attrs:{size:22}})],1)],1)},Q=[],W=n(6830);const ee="ch-ch00";var te={components:{DxBarGauge:W.DxBarGauge,DxLabel:W.DxLabel,DxExport:W.DxExport,DxTitle:W.DxTitle,DxFont:W.DxFont},data(){return{values:[47.27,65.32,84.59,71.86],format:{type:"fixedPoint",precision:1},ch00:ee}},methods:{customizeText({valueText:e}){return`${e} %`}}},ne=te,re=(0,l.Z)(ne,Y,Q,!1,null,null,null),se=re.exports;const ae="helper0",oe="helper00",ie="helper1",le="helper11",ce="helper2",ue="helper22";var de={components:{GaugeMy:se,ChartMy:K,GraphMy:z},data(){return{helper0:ae,helper00:oe,helper1:ie,helper11:le,helper2:ce,helper22:ue,message:null}},mounted(){document.cm0=this.cm0,this.message=this.$route.params.message,this.noty()},computed:{cm0:function(){return[this.$refs[ae].$refs["ch-ch00"].instance,this.$refs[oe].$refs["ch-ch00"].instance,this.$refs[ie].$refs["ch-ch11"].instance,this.$refs[le].$refs["ch-ch11"].instance,this.$refs[ce].$refs["ch-ch22"].instance,this.$refs[ue].$refs["ch-ch22"].instance]}},methods:{noty:function(){if(this.message){let e=this.message.substr(this.message.indexOf("=")+1);this.message=null,setTimeout((function(){(0,A.Z)(e,"success",2500)}),2e3)}}}},me=de,he=(0,l.Z)(me,E,T,!1,null,null,null),pe=he.exports,fe=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"side-nav-inner-toolbar"},[n("dx-drawer",{ref:e.helper1,staticClass:"drawer",attrs:{position:"before",template:"menu",opened:e.menuOpened,"opened-state-mode":e.drawerOptions.menuMode,"reveal-mode":e.drawerOptions.menuRevealMode,"min-size":e.drawerOptions.minMenuSize,shading:e.drawerOptions.shaderEnabled,"close-on-outside-click":e.drawerOptions.closeOnOutsideClick},on:{"update:opened":function(t){e.menuOpened=t}},scopedSlots:e._u([{key:"menu",fn:function(){return[n("side-nav-menu",{attrs:{"compact-mode":!e.menuOpened},on:{click:e.handleSideBarClick}},[n("dx-toolbar",{attrs:{id:"navigation-header"}},[e.isXSmall?e._e():n("dx-item",{attrs:{location:"before","css-class":"menu-button"},scopedSlots:e._u([{key:"default",fn:function(){return[n("dx-button",{attrs:{icon:"menu","styling-mode":"text"},on:{click:e.toggleMenu}})]},proxy:!0}],null,!1,2441613699)}),n("dx-item",{attrs:{location:"before","css-class":"header-title dx-toolbar-label"},scopedSlots:e._u([{key:"default",fn:function(){return[n("div",[n("div",[e._v(e._s(e.title))])])]},proxy:!0}])})],1)],1)]},proxy:!0}])},[n("div",{staticClass:"container"},[n("header-toolbar",{attrs:{"menu-toggle-enabled":e.headerMenuTogglerEnabled,"toggle-menu-func":e.toggleMenu}}),n("dx-scroll-view",{ref:"scrollViewRef",staticClass:"layout-body with-footer"},[e._t("default"),e._t("footer")],2)],1)])],1)},ge=[],xe=n(8954),ye=n.n(xe),ve=n(7074),be=n.n(ve),De=n(177),we=n.n(De),Ce=n(3074),ke=n.n(Ce),Se=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("header",{staticClass:"header-component"},[n("dx-toolbar",{staticClass:"header-toolbar",scopedSlots:e._u([{key:"menuUserItem",fn:function(){return[n("user-panel",{attrs:{user:e.user,"menu-items":e.userMenuItems,"menu-mode":"list"}})]},proxy:!0}])},[n("dx-item",{attrs:{visible:e.menuToggleEnabled,location:"before","css-class":"menu-button"},scopedSlots:e._u([{key:"default",fn:function(){return[n("dx-button",{attrs:{icon:"menu","styling-mode":"text"},on:{click:e.toggleMenuFunc}})]},proxy:!0}])}),e.title?n("dx-item",{attrs:{location:"before","css-class":"header-title dx-toolbar-label"}},[[n("div",[e._v(e._s(e.title))])]],2):e._e(),n("dx-item",{attrs:{location:"after","locate-in-menu":"auto","menu-item-template":"menuUserItem"},scopedSlots:e._u([{key:"default",fn:function(){return[n("div",[n("dx-button",{staticClass:"user-button authorization",attrs:{width:220,height:"100%","styling-mode":"text"}},[n("user-panel",{attrs:{user:e.user,"menu-items":e.userMenuItems,"menu-mode":"context"}})],1)],1)]},proxy:!0}])})],1)],1)},_e=[],Oe=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"user-panel"},[n("div",{staticClass:"user-info"},[n("div",{staticClass:"image-container"},[n("div",{staticClass:"user-image",style:{backgroundImage:"url("+e.user.avatarUrl+")"}})]),n("div",{staticClass:"user-name"},[e._v(e._s(e.user.username))])]),"context"===e.menuMode?n("dx-context-menu",{attrs:{target:".user-button",items:e.menuItems,width:220,"show-event":"dxclick","css-class":"user-menu"}},[n("dx-position",{attrs:{my:"top center",at:"bottom center"}})],1):e._e(),"list"===e.menuMode?n("dx-list",{staticClass:"dx-toolbar-menu-action",attrs:{items:e.menuItems}}):e._e()],1)},Ee=[],Te=n(2164),Ae=n.n(Te),$e=n(8475),Le=n.n($e),Me={props:{menuMode:String,menuItems:Array,user:Object},components:{DxContextMenu:Ae(),DxPosition:Te.DxPosition,DxList:Le()}},Pe=Me,Ie=(0,l.Z)(Pe,Oe,Ee,!1,null,null,null),Ze=Ie.exports,Be={props:{menuToggleEnabled:Boolean,title:String,toggleMenuFunc:Function,logOutFunc:Function},created(){O.Z.getUser(this.$store).then((e=>this.user=e.data)).catch((()=>{}))},data(){return{user:{},userMenuItems:[{text:"About",icon:"user",onClick:this.onProfileClick},{text:this.$store.getters.getLogged?"LogOut":"LogIn",icon:"runner",onClick:this.onLogoutClick}]}},methods:{onLogoutClick:async function(){let e=await O.Z.logOut(this.$store);e&&this.$router.push({path:"/login-form",query:{redirect:this.$route.path}}).catch((()=>{}))},onProfileClick(){this.$router.push({path:"/profile",query:{redirect:this.$route.path}}).catch((()=>{}))}},components:{DxButton:ye(),DxToolbar:ke(),DxItem:Ce.DxItem,UserPanel:Ze}},Ve=Be,je=(0,l.Z)(Ve,Se,_e,!1,null,null,null),ze=je.exports,qe=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"dx-swatch-additional side-navigation-menu",on:{click:e.forwardClick}},[e._t("default"),n("div",{staticClass:"menu-container"},[n("dx-tree-view",{ref:e.treeViewRef,attrs:{items:e.itemsFiltered,"key-expr":"path","selection-mode":"single","focus-state-enabled":!1,"expand-event":"click",width:"100%"},on:{"item-click":e.handleItemClick}})],1)],2)},Ue=[],Ge=n(7426),Fe=n.n(Ge),Ne=[{text:"Home",path:"/home",icon:"home"},{text:"Tables",icon:"folder",items:[{text:"Money M2",path:"/money_m2"},{text:"Population",path:"/people"}]},{text:"GDP Growth",path:"/gdp_growth",icon:"folder"},{text:"Admin",role:"Admin",icon:"folder",items:[{text:"Users",path:"/users"}]},{text:"Data Source",role:"User",icon:"folder",items:[{text:"By Countries",path:"/countries"},{text:"By Indicators",path:"/indicators"},{text:"By Years",path:"/years"}]}];const Re="treeViewRef",He=y()["screen-large"];var Xe={props:{compactMode:Boolean},data(){return{treeViewRef:Re}},computed:{itemsFiltered:function(){let e=Ne.map((e=>(e.path&&!/^\//.test(e.path)&&(e.path=`/${e.path}`),{...e,expanded:He})));return O.Z.filterMenuForUserRole(this.$store,e)}},methods:{forwardClick(...e){this.$emit("click",e)},handleItemClick(e){if(!e.itemData.path||this.compactMode)return;this.$router.push(e.itemData.path);const t=e.event;t.stopPropagation()},updateSelection(){this.treeView&&(this.treeView.selectItem(this.$route.path),this.treeView.expandItem(this.$route.path))}},mounted(){this.storage=this.$store,this.treeView=this.$refs[Re]&&this.$refs[Re].instance,this.updateSelection(),this.compactMode&&this.treeView.collapseAll()},watch:{$route(){this.updateSelection()},compactMode(){this.compactMode?this.treeView.collapseAll():this.updateSelection()}},components:{DxTreeView:Fe()}},Je=Xe,Ke=(0,l.Z)(Je,qe,Ue,!1,null,null,null),Ye=Ke.exports;const Qe="helper1";var We={props:{title:String,isXSmall:Boolean,isLarge:Boolean},methods:{toggleMenu(e){const t=e.event;t.stopPropagation(),this.menuOpened&&(this.menuTemporaryOpened=!1),this.menuOpened=!this.menuOpened},handleSideBarClick(){!1===this.menuOpened&&(this.menuTemporaryOpened=!0),this.menuOpened=!0}},data(){return{menuOpened:this.isLarge,menuTemporaryOpened:!1,menuItems:Ne,helper1:Qe}},computed:{drawerOptions(){const e=!this.isLarge;return{menuMode:this.isLarge?"shrink":"overlap",menuRevealMode:this.isXSmall?"slide":"expand",minMenuSize:this.isXSmall?1:60,menuOpened:this.isLarge,closeOnOutsideClick:e,shaderEnabled:e}},headerMenuTogglerEnabled(){return this.isXSmall},scrollView(){return this.$refs["scrollViewRef"].instance}},watch:{isLarge(){this.menuTemporaryOpened||(this.menuOpened=this.isLarge)},$route(){!this.menuTemporaryOpened&&this.isLarge||(this.menuOpened=!1,this.menuTemporaryOpened=!1),this.scrollView.scrollTo(0)}},mounted:function(){this.$emit("mounted"),document.wraw1=this.$refs[Qe]},components:{DxButton:ye(),DxDrawer:be(),DxScrollView:we(),DxToolbar:ke(),DxItem:Ce.DxItem,HeaderToolbar:ze,SideNavMenu:Ye}},et=We,tt=(0,l.Z)(et,fe,ge,!1,null,null,null),nt=tt.exports,rt=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("dx-scroll-view",{staticClass:"with-footer single-card",attrs:{height:"100%",width:"100%"}},[n("div",{staticClass:"dx-card content"},[n("div",{staticClass:"header"},[n("div",{staticClass:"title"},[e._v(e._s(e.title))]),n("div",{staticClass:"description"},[e._v(e._s(e.description))])]),e._t("default")],2)])},st=[],at={components:{DxScrollView:we()},props:{title:String,description:String}},ot=at,it=(0,l.Z)(ot,rt,st,!1,null,null,null),lt=it.exports,ct=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",[n("h2",{staticClass:"content-block"},[e._v("GDP is not a target..")]),n("div",{staticClass:"content-block"},[n("DxChart",{attrs:{id:"chart",rotated:!0,"data-source":"https://js.devexpress.com/Demos/WidgetsGallery/JSDemos/data/simpleJSON.json",title:"In comparison"}},[n("DxArgumentAxis",[n("DxLabel",{attrs:{"customize-text":e.customizeLabelText}})],1),n("DxValueAxis",[n("DxTick",{attrs:{visible:!1}}),n("DxLabel",{attrs:{visible:!1}})],1),n("DxSeries",{attrs:{"argument-field":"day","value-field":"sales",type:"bar",color:"#79cac4"}},[n("DxLabel",{attrs:{visible:!0,"background-color":"#c18e92"}})],1),n("DxLegend",{attrs:{visible:!1}}),n("DxExport",{attrs:{enabled:!1}})],1)],1)])},ut=[],dt={components:{DxChart:P(),DxArgumentAxis:M.DxArgumentAxis,DxExport:M.DxExport,DxSeries:M.DxSeries,DxValueAxis:M.DxValueAxis,DxLabel:M.DxLabel,DxLegend:M.DxLegend,DxTick:M.DxTick},methods:{customizeLabelText({valueText:e}){return`Day ${e}`}}},mt=dt,ht=(0,l.Z)(mt,ct,ut,!1,null,null,null),pt=ht.exports;r["default"].use(_.Z);const ft=new _.Z({routes:[{path:"/home/:message?",name:"home",meta:{requiresAuth:!1},components:{layout:nt,content:pe}},{path:"/money_m2",name:"Money M2",meta:{requiresAuth:!0},components:{layout:nt,content:()=>Promise.all([n.e(289),n.e(144),n.e(82),n.e(201)]).then(n.bind(n,9874))}},{path:"/people",name:"Population",meta:{requiresAuth:!0},components:{layout:nt,content:()=>Promise.all([n.e(289),n.e(144),n.e(82),n.e(201)]).then(n.bind(n,3596))}},{path:"/login-form",name:"login-form",meta:{requiresAuth:!1},components:{layout:lt,content:()=>Promise.all([n.e(289),n.e(82),n.e(535)]).then(n.bind(n,5941))},props:{layout:{title:"Sign In"}}},{path:"/reset-password",name:"reset-password",meta:{requiresAuth:!1},components:{layout:lt,content:()=>Promise.all([n.e(289),n.e(82),n.e(535)]).then(n.bind(n,6307))},props:{layout:{title:"Reset Password",description:"Please enter the email address that you used to register, and we will send you a link to reset your password via Email."}}},{path:"/create-account",name:"create-account",meta:{requiresAuth:!1},components:{layout:lt,content:()=>Promise.all([n.e(289),n.e(82),n.e(535)]).then(n.bind(n,8381))},props:{layout:{title:"Sign Up"}}},{path:"/change-password/:recoveryCode",name:"change-password",meta:{requiresAuth:!1},components:{layout:lt,content:()=>Promise.all([n.e(289),n.e(82),n.e(535)]).then(n.bind(n,4618))},props:{layout:{title:"Change Password"}}},{path:"/",redirect:"/home"},{path:"/recovery",redirect:"/home"},{path:"*",redirect:"/home"},{path:"/gdp_growth",name:"GDP Data",meta:{requiresAuth:!0},components:{layout:nt,content:pt}},{path:"/profile",name:"Profile",meta:{requiresAuth:!0},components:{layout:nt,content:()=>Promise.all([n.e(289),n.e(144),n.e(82),n.e(201)]).then(n.bind(n,110))}},{path:"/users",name:"Users Table",meta:{requiresAuth:!0},components:{layout:nt,content:()=>Promise.all([n.e(289),n.e(144),n.e(328)]).then(n.bind(n,6829))}},{path:"/countries",name:"Countries Table",meta:{requiresAuth:!1},components:{layout:nt,content:()=>Promise.all([n.e(289),n.e(144),n.e(328)]).then(n.bind(n,6037))}},{path:"/Indicators",name:"Indicators Table",meta:{requiresAuth:!1},components:{layout:nt,content:()=>Promise.all([n.e(289),n.e(144),n.e(328)]).then(n.bind(n,7246))}},{path:"/years",name:"Years Table",meta:{requiresAuth:!1},components:{layout:nt,content:()=>Promise.all([n.e(289),n.e(144),n.e(328)]).then(n.bind(n,5467))}}]});ft.beforeEach(((e,t,n)=>{"login-form"===e.name&&O.Z.loggedIn(ft.app.$store)&&n({name:"home"}),e.matched.some((e=>e.meta.requiresAuth))?O.Z.loggedIn(ft.app.$store)?n():n({name:"login-form",query:{redirect:e.fullPath}}):n()}));var gt=ft,xt={title:"SiForeca"},yt=n(4665);r["default"].config.productionTip=!1,r["default"].prototype.$appInfo=xt,r["default"].use(yt.ZP);const vt=new yt.ZP.Store({state:{token:"",loggedIn:!1},mutations:{SET_TOKEN:(e,t)=>{e.token=t},SET_LOGGED:(e,t)=>{e.loggedIn=t}},actions:{setToken(e,t){e.commit("SET_TOKEN",t)},setLogged(e,t){e.commit("SET_LOGGED",t)}},getters:{getToken:e=>e.token,getLogged:e=>e.loggedIn}});let bt=new r["default"]({router:gt,store:vt,render:e=>e(S)});bt.$mount("#app")}},t={};function n(r){var s=t[r];if(void 0!==s)return s.exports;var a=t[r]={exports:{}};return e[r].call(a.exports,a,a.exports,n),a.exports}n.m=e,function(){var e=[];n.O=function(t,r,s,a){if(!r){var o=1/0;for(u=0;u<e.length;u++){r=e[u][0],s=e[u][1],a=e[u][2];for(var i=!0,l=0;l<r.length;l++)(!1&a||o>=a)&&Object.keys(n.O).every((function(e){return n.O[e](r[l])}))?r.splice(l--,1):(i=!1,a<o&&(o=a));if(i){e.splice(u--,1);var c=s();void 0!==c&&(t=c)}}return t}a=a||0;for(var u=e.length;u>0&&e[u-1][2]>a;u--)e[u]=e[u-1];e[u]=[r,s,a]}}(),function(){n.n=function(e){var t=e&&e.__esModule?function(){return e["default"]}:function(){return e};return n.d(t,{a:t}),t}}(),function(){n.d=function(e,t){for(var r in t)n.o(t,r)&&!n.o(e,r)&&Object.defineProperty(e,r,{enumerable:!0,get:t[r]})}}(),function(){n.f={},n.e=function(e){return Promise.all(Object.keys(n.f).reduce((function(t,r){return n.f[r](e,t),t}),[]))}}(),function(){n.u=function(e){return"js/"+({201:"domain",328:"admin",535:"login"}[e]||e)+"."+{82:"64970c57",144:"9f4e5b3a",201:"02cde5dd",289:"029e6843",328:"b750b95a",535:"93d99c1e"}[e]+".js"}}(),function(){n.miniCssF=function(e){return"css/"+{201:"domain",328:"admin",535:"login"}[e]+"."+{201:"b3b236e9",328:"bee36682",535:"5033ea94"}[e]+".css"}}(),function(){n.g=function(){if("object"===typeof globalThis)return globalThis;try{return this||new Function("return this")()}catch(e){if("object"===typeof window)return window}}()}(),function(){n.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)}}(),function(){var e={},t="siforeca:";n.l=function(r,s,a,o){if(e[r])e[r].push(s);else{var i,l;if(void 0!==a)for(var c=document.getElementsByTagName("script"),u=0;u<c.length;u++){var d=c[u];if(d.getAttribute("src")==r||d.getAttribute("data-webpack")==t+a){i=d;break}}i||(l=!0,i=document.createElement("script"),i.charset="utf-8",i.timeout=120,n.nc&&i.setAttribute("nonce",n.nc),i.setAttribute("data-webpack",t+a),i.src=r),e[r]=[s];var m=function(t,n){i.onerror=i.onload=null,clearTimeout(h);var s=e[r];if(delete e[r],i.parentNode&&i.parentNode.removeChild(i),s&&s.forEach((function(e){return e(n)})),t)return t(n)},h=setTimeout(m.bind(null,void 0,{type:"timeout",target:i}),12e4);i.onerror=m.bind(null,i.onerror),i.onload=m.bind(null,i.onload),l&&document.head.appendChild(i)}}}(),function(){n.r=function(e){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})}}(),function(){n.p="/"}(),function(){var e=function(e,t,n,r){var s=document.createElement("link");s.rel="stylesheet",s.type="text/css";var a=function(a){if(s.onerror=s.onload=null,"load"===a.type)n();else{var o=a&&("load"===a.type?"missing":a.type),i=a&&a.target&&a.target.href||t,l=new Error("Loading CSS chunk "+e+" failed.\n("+i+")");l.code="CSS_CHUNK_LOAD_FAILED",l.type=o,l.request=i,s.parentNode.removeChild(s),r(l)}};return s.onerror=s.onload=a,s.href=t,document.head.appendChild(s),s},t=function(e,t){for(var n=document.getElementsByTagName("link"),r=0;r<n.length;r++){var s=n[r],a=s.getAttribute("data-href")||s.getAttribute("href");if("stylesheet"===s.rel&&(a===e||a===t))return s}var o=document.getElementsByTagName("style");for(r=0;r<o.length;r++){s=o[r],a=s.getAttribute("data-href");if(a===e||a===t)return s}},r=function(r){return new Promise((function(s,a){var o=n.miniCssF(r),i=n.p+o;if(t(o,i))return s();e(r,i,s,a)}))},s={143:0};n.f.miniCss=function(e,t){var n={201:1,328:1,535:1};s[e]?t.push(s[e]):0!==s[e]&&n[e]&&t.push(s[e]=r(e).then((function(){s[e]=0}),(function(t){throw delete s[e],t})))}}(),function(){var e={143:0};n.f.j=function(t,r){var s=n.o(e,t)?e[t]:void 0;if(0!==s)if(s)r.push(s[2]);else{var a=new Promise((function(n,r){s=e[t]=[n,r]}));r.push(s[2]=a);var o=n.p+n.u(t),i=new Error,l=function(r){if(n.o(e,t)&&(s=e[t],0!==s&&(e[t]=void 0),s)){var a=r&&("load"===r.type?"missing":r.type),o=r&&r.target&&r.target.src;i.message="Loading chunk "+t+" failed.\n("+a+": "+o+")",i.name="ChunkLoadError",i.type=a,i.request=o,s[1](i)}};n.l(o,l,"chunk-"+t,t)}},n.O.j=function(t){return 0===e[t]};var t=function(t,r){var s,a,o=r[0],i=r[1],l=r[2],c=0;if(o.some((function(t){return 0!==e[t]}))){for(s in i)n.o(i,s)&&(n.m[s]=i[s]);if(l)var u=l(n)}for(t&&t(r);c<o.length;c++)a=o[c],n.o(e,a)&&e[a]&&e[a][0](),e[a]=0;return n.O(u)},r=self["webpackChunksiforeca"]=self["webpackChunksiforeca"]||[];r.forEach(t.bind(null,0)),r.push=t.bind(null,r.push.bind(r))}();var r=n.O(void 0,[998],(function(){return n(6897)}));r=n.O(r)})();
//# sourceMappingURL=app.4169a732.js.map