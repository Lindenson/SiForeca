"use strict";(self["webpackChunksiforeca"]=self["webpackChunksiforeca"]||[]).push([[535],{94618:function(t,e,n){n.r(e),n.d(e,{default:function(){return h}});var r=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("form",{on:{submit:function(e){return e.preventDefault(),t.onSubmit.apply(null,arguments)}}},[n("dx-form",{attrs:{"form-data":t.formData,disabled:t.loading},scopedSlots:t._u([{key:"changePassword",fn:function(){return[n("div",[n("span",{staticClass:"dx-button-text"},[t.loading?n("dx-loadIndicator",{attrs:{width:"24px",height:"24px",visible:!0}}):t._e(),t.loading?t._e():n("span",[t._v("Continue")])],1)])]},proxy:!0}])},[n("dx-item",{attrs:{"data-field":"password","editor-type":"dxTextBox","editor-options":{stylingMode:"filled",placeholder:"Password",mode:"password"}}},[n("dx-required-rule",{attrs:{message:"Password is required"}}),n("dx-label",{attrs:{visible:!1}})],1),n("dx-item",{attrs:{"data-field":"confirmedPassword","editor-type":"dxTextBox","editor-options":{stylingMode:"filled",placeholder:"Confirm Password",mode:"password"}}},[n("dx-required-rule",{attrs:{message:"Password is required"}}),n("dx-custom-rule",{attrs:{message:"Passwords do not match","validation-callback":t.confirmPassword}}),n("dx-label",{attrs:{visible:!1}})],1),n("dx-button-item",[n("dx-button-options",{attrs:{width:"100%",type:"default",template:"changePassword","use-submit-behavior":!0}})],1)],1)],1)},a=[],o=n(16198),i=(n(78975),n(60082)),s=n.n(i),l=n(69472),d=n.n(l),u=n(33009),c=n(41705),m={components:{DxForm:s(),DxItem:i.DxItem,DxLabel:i.DxLabel,DxButtonItem:i.DxButtonItem,DxButtonOptions:i.DxButtonOptions,DxRequiredRule:i.DxRequiredRule,DxCustomRule:i.DxCustomRule,DxLoadIndicator:d()},created:function(){this.recoveryCode=this.$route.params.recoveryCode},data:function(){return{formData:{},loading:!1,recoveryCode:""}},methods:{onSubmit:function(){var t=(0,o.Z)(regeneratorRuntime.mark((function t(){var e,n;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return e=this.formData.password,this.loading=!0,t.next=4,c.Z.changePassword(e,this.recoveryCode);case 4:n=t.sent,this.loading=!1,n.isOk?((0,u.Z)(n.message,"success",2500),this.$router.push({path:"/login-form"}).catch((function(){}))):(0,u.Z)(n.message,"error",2e3);case 7:case"end":return t.stop()}}),t,this)})));function e(){return t.apply(this,arguments)}return e}(),confirmPassword:function(t){return t.value===this.formData.password}}},x=m,p=n(1001),f=(0,p.Z)(x,r,a,!1,null,null,null),h=f.exports},28381:function(t,e,n){n.r(e),n.d(e,{default:function(){return h}});var r=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("form",{staticClass:"create-account-form",on:{submit:function(e){return e.preventDefault(),t.onSubmit.apply(null,arguments)}}},[n("dx-form",{attrs:{"form-data":t.formData,disabled:t.loading},scopedSlots:t._u([{key:"createAccount",fn:function(){return[n("div",[n("span",{staticClass:"dx-button-text"},[t.loading?n("dx-loadIndicator",{attrs:{width:"24px",height:"24px",visible:!0}}):t._e(),t.loading?t._e():n("span",[t._v("Create a new account")])],1)])]},proxy:!0}])},[n("dx-item",{attrs:{"data-field":"email","editor-type":"dxTextBox","editor-options":{stylingMode:"filled",placeholder:"Email",mode:"email"}}},[n("dx-required-rule",{attrs:{message:"Email is required"}}),n("dx-email-rule",{attrs:{message:"Email is invalid"}}),n("dx-label",{attrs:{visible:!1}})],1),n("dx-item",{attrs:{"data-field":"password","editor-type":"dxTextBox","editor-options":{stylingMode:"filled",placeholder:"Password",mode:"password"}}},[n("dx-required-rule",{attrs:{message:"Password is required"}}),n("dx-label",{attrs:{visible:!1}})],1),n("dx-item",{attrs:{"data-field":"confirmedPassword","editor-type":"dxTextBox","editor-options":{stylingMode:"filled",placeholder:"Confirm Password",mode:"password"}}},[n("dx-required-rule",{attrs:{message:"Password is required"}}),n("dx-custom-rule",{attrs:{message:"Passwords do not match","validation-callback":t.confirmPassword}}),n("dx-label",{attrs:{visible:!1}})],1),n("dx-item",{scopedSlots:t._u([{key:"default",fn:function(){return[n("div",{staticClass:"policy-info"},[t._v(" By creating an account, you agree to the "),n("router-link",{attrs:{to:"#"}},[t._v("Terms of Service")]),t._v(" and "),n("router-link",{attrs:{to:"#"}},[t._v("Privacy Policy")])],1)]},proxy:!0}])}),n("dx-button-item",[n("dx-button-options",{attrs:{width:"100%",type:"default",template:"createAccount","use-submit-behavior":!0}})],1),n("dx-item",{scopedSlots:t._u([{key:"default",fn:function(){return[n("div",{staticClass:"login-link"},[t._v(" Have an account? "),n("router-link",{attrs:{to:"/login"}},[t._v("Sign In")])],1)]},proxy:!0}])})],1)],1)},a=[],o=n(16198),i=(n(78975),n(60082)),s=n.n(i),l=n(69472),d=n.n(l),u=n(33009),c=n(41705),m={components:{DxForm:s(),DxItem:i.DxItem,DxLabel:i.DxLabel,DxButtonItem:i.DxButtonItem,DxButtonOptions:i.DxButtonOptions,DxRequiredRule:i.DxRequiredRule,DxCustomRule:i.DxCustomRule,DxEmailRule:i.DxEmailRule,DxLoadIndicator:d()},data:function(){return{formData:{},loading:!1}},methods:{onSubmit:function(){var t=(0,o.Z)(regeneratorRuntime.mark((function t(){var e,n,r,a;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return e=this.formData,n=e.email,r=e.password,this.loading=!0,t.next=4,c.Z.createAccount(n,r);case 4:a=t.sent,this.loading=!1,a.isOk?((0,u.Z)(a.message,"success",2e3),this.$router.push("/login-form").catch((function(){}))):(0,u.Z)(a.message,"error",2e3);case 7:case"end":return t.stop()}}),t,this)})));function e(){return t.apply(this,arguments)}return e}(),confirmPassword:function(t){return t.value===this.formData.password}}},x=m,p=n(1001),f=(0,p.Z)(x,r,a,!1,null,null,null),h=f.exports},45941:function(t,e,n){n.r(e),n.d(e,{default:function(){return h}});var r=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("form",{staticClass:"login-form",on:{submit:function(e){return e.preventDefault(),t.onSubmit.apply(null,arguments)}}},[n("dx-form",{attrs:{"form-data":t.formData,disabled:t.loading},scopedSlots:t._u([{key:"signInTemplate",fn:function(){return[n("div",[n("span",{staticClass:"dx-button-text"},[t.loading?n("dx-load-indicator",{attrs:{width:"24px",height:"24px",visible:!0}}):t._e(),t.loading?t._e():n("span",[t._v("Sign In")])],1)])]},proxy:!0}])},[n("dx-item",{attrs:{"data-field":"email","editor-type":"dxTextBox","editor-options":{stylingMode:"filled",placeholder:"Email",mode:"email"}}},[n("dx-required-rule",{attrs:{message:"Email is required"}}),n("dx-email-rule",{attrs:{message:"Email is invalid"}}),n("dx-label",{attrs:{visible:!1}})],1),n("dx-item",{attrs:{"data-field":"password","editor-type":"dxTextBox","editor-options":{stylingMode:"filled",placeholder:"Password",mode:"password"}}},[n("dx-required-rule",{attrs:{message:"Password is required"}}),n("dx-label",{attrs:{visible:!1}})],1),n("dx-item",{attrs:{"data-field":"rememberMe","editor-type":"dxCheckBox","editor-options":{text:"Remember me",elementAttr:{class:"form-text"}}}},[n("dx-label",{attrs:{visible:!1}})],1),n("dx-button-item",[n("dx-button-options",{attrs:{width:"100%",type:"default",template:"signInTemplate","use-submit-behavior":!0}})],1),n("dx-item",{scopedSlots:t._u([{key:"default",fn:function(){return[n("div",{staticClass:"link"},[n("router-link",{attrs:{to:"/reset-password"}},[t._v("Forgot password?")])],1)]},proxy:!0}])}),n("dx-button-item",[n("dx-button-options",{attrs:{text:"Create an account",width:"100%","on-click":t.onCreateAccountClick}})],1)],1)],1)},a=[],o=n(16198),i=(n(78975),n(69472)),s=n.n(i),l=n(60082),d=n.n(l),u=n(33009),c=n(41705),m={data:function(){return{formData:{},loading:!1}},methods:{onCreateAccountClick:function(){this.$router.push("/create-account")},onSubmit:function(){var t=(0,o.Z)(regeneratorRuntime.mark((function t(){var e,n,r,a;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return e=this.formData,n=e.email,r=e.password,this.loading=!0,t.next=4,c.Z.logIn(n,r,this.$store);case 4:a=t.sent,a.isOk?this.$router.push("/home").catch((function(){})):((0,u.Z)(a.message,"error",2e3),this.loading=!1);case 6:case"end":return t.stop()}}),t,this)})));function e(){return t.apply(this,arguments)}return e}()},components:{DxLoadIndicator:s(),DxForm:d(),DxEmailRule:l.DxEmailRule,DxRequiredRule:l.DxRequiredRule,DxItem:l.DxItem,DxLabel:l.DxLabel,DxButtonItem:l.DxButtonItem,DxButtonOptions:l.DxButtonOptions}},x=m,p=n(1001),f=(0,p.Z)(x,r,a,!1,null,null,null),h=f.exports},96307:function(t,e,n){n.r(e),n.d(e,{default:function(){return h}});var r=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("form",{staticClass:"reset-password-form",on:{submit:function(e){return e.preventDefault(),t.onSubmit.apply(null,arguments)}}},[n("dx-form",{attrs:{"form-data":t.formData,disabled:t.loading},scopedSlots:t._u([{key:"resetTemplate",fn:function(){return[n("div",[n("span",{staticClass:"dx-button-text"},[t.loading?n("dx-load-indicator",{attrs:{width:"24px",height:"24px",visible:!0}}):t._e(),t.loading?t._e():n("span",[t._v("Reset my password")])],1)])]},proxy:!0}])},[n("dx-item",{attrs:{"data-field":"email","editor-type":"dxTextBox","editor-options":{stylingMode:"filled",placeholder:"Email",mode:"email"}}},[n("dx-required-rule",{attrs:{message:"Email is required"}}),n("dx-email-rule",{attrs:{message:"Email is invalid"}}),n("dx-label",{attrs:{visible:!1}})],1),n("dx-button-item",[n("dx-button-options",{attrs:{"element-attr":{class:"submit-button"},width:"100%",type:"default",template:"resetTemplate","use-submit-behavior":!0}})],1),n("dx-item",{scopedSlots:t._u([{key:"default",fn:function(){return[n("div",{staticClass:"login-link"},[t._v(" Return to "),n("router-link",{attrs:{to:"/login"}},[t._v("Sign In")])],1)]},proxy:!0}])})],1)],1)},a=[],o=n(16198),i=(n(78975),n(60082)),s=n.n(i),l=n(69472),d=n.n(l),u=n(33009),c=n(41705),m={components:{DxForm:s(),DxItem:i.DxItem,DxLabel:i.DxLabel,DxButtonItem:i.DxButtonItem,DxButtonOptions:i.DxButtonOptions,DxRequiredRule:i.DxRequiredRule,DxEmailRule:i.DxEmailRule,DxLoadIndicator:d()},data:function(){return{formData:{},loading:!1}},methods:{onSubmit:function(){var t=(0,o.Z)(regeneratorRuntime.mark((function t(){var e,n;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return e=this.formData.email,this.loading=!0,t.next=4,c.Z.resetPassword(e);case 4:n=t.sent,this.loading=!1,n.isOk?((0,u.Z)(n.message,"success",2500),this.$router.push({path:"/login-form"}).catch((function(){}))):(0,u.Z)(n.message,"error",2e3);case 7:case"end":return t.stop()}}),t,this)})));function e(){return t.apply(this,arguments)}return e}()}},x=m,p=n(1001),f=(0,p.Z)(x,r,a,!1,null,null,null),h=f.exports},69472:function(t,e,n){
/*!
 * devextreme-vue
 * Version: 21.2.6
 * Build date: Tue Mar 01 2022
 *
 * Copyright (c) 2012 - 2022 Developer Express Inc. ALL RIGHTS RESERVED
 *
 * This software may be modified and distributed under the terms
 * of the MIT license. See the LICENSE file in the root of the project for details.
 *
 * https://github.com/DevExpress/devextreme-vue
 */
n(9653);var r=this&&this.__importDefault||function(t){return t&&t.__esModule?t:{default:t}};Object.defineProperty(e,"__esModule",{value:!0}),e.DxLoadIndicator=void 0;var a=r(n(10422)),o=n(26876),i=o.createComponent({props:{elementAttr:Object,height:[Function,Number,String],hint:String,indicatorSrc:String,onContentReady:Function,onDisposing:Function,onInitialized:Function,onOptionChanged:Function,rtlEnabled:Boolean,visible:Boolean,width:[Function,Number,String]},emits:{"update:isActive":null,"update:hoveredElement":null,"update:elementAttr":null,"update:height":null,"update:hint":null,"update:indicatorSrc":null,"update:onContentReady":null,"update:onDisposing":null,"update:onInitialized":null,"update:onOptionChanged":null,"update:rtlEnabled":null,"update:visible":null,"update:width":null},computed:{instance:function(){return this.$_instance}},beforeCreate:function(){this.$_WidgetClass=a.default,this.$_hasAsyncTemplate=!0}});e.DxLoadIndicator=i,e["default"]=i}}]);
//# sourceMappingURL=login-legacy.309aab4e.js.map