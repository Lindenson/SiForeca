import Vue from "vue";
import Router from "vue-router";
import auth from "./auth";
import Home from "./views/home-my";
import defaultLayout from "./layouts/side-nav-inner-toolbar";
import simpleLayout from "./layouts/single-card";
import Gdp_graph from "@/views/gdp-graph";



Vue.use(Router);

const router = new Router({
  routes: [
    {
      path: "/home/:message?",
      name: "home",
      meta: { requiresAuth: false },
      components: {
        layout: defaultLayout,
        content: Home
      }
    },
    {
      path: "/money_m2",
      name: "Money M2",
      meta: { requiresAuth: true },
      components: {
        layout: defaultLayout,
        content: () => {
          return import(/* webpackChunkName: "domain" */ "./views/money-my")
        }
      }
    },
    {
      path: "/people",
      name: "Population",
      meta: { requiresAuth: true },
      components: {
        layout: defaultLayout,
        content: () =>
            import(/* webpackChunkName: "domain" */ "./views/task-my")
      }
    },
    {
      path: "/login-form",
      name: "login-form",
      meta: { requiresAuth: false },
      components: {
        layout: simpleLayout,
        content: () =>
          import(/* webpackChunkName: "login" */ "./views/login-form")
      },
      props: {
        layout: {
          title: "Sign In"
        }
      }
    },
    {
      path: "/reset-password",
      name: "reset-password",
      meta: { requiresAuth: false },
      components: {
        layout: simpleLayout,
        content: () =>
          import(/* webpackChunkName: "login" */ "./views/reset-password-form")
      },
      props: {
        layout: {
          title: "Reset Password",
          description: "Please enter the email address that you used to register, and we will send you a link to reset your password via Email."
        }
      }
    },
    {
      path: "/create-account",
      name: "create-account",
      meta: { requiresAuth: false },
      components: {
        layout: simpleLayout,
        content: () =>
          import(/* webpackChunkName: "login" */ "./views/create-account-form")
      },
      props: {
        layout: {
          title: "Sign Up"
        }
      }
    },
    {
      path: "/change-password/:recoveryCode",
      name: "change-password",
      meta: { requiresAuth: false },
      components: {
        layout: simpleLayout,
        content: () =>
          import(/* webpackChunkName: "login" */ "./views/change-password-form")
      },
      props: {
        layout: {
          title: "Change Password"
        }
      }
    },
    {
      path: "/",
      redirect: "/home"
    },
    {
      path: "/recovery",
      redirect: "/home"
    },
    {
      path: "*",
      redirect: "/home"
    }, 
    {
      path: "/gdp_growth",
      name: "GDP Data",
      meta: { requiresAuth: true },
      components:
      {
        layout: defaultLayout,
        content: Gdp_graph
      }
    },
    {
      path: "/profile",
      name: "Profile",
      meta: { requiresAuth: true },
      components:
          {
            layout: defaultLayout,
            content: () =>
                import(/* webpackChunkName: "domain" */ "./views/profile-my")
          }
    },
    {
      path: "/users",
      name: "Users Table",
      meta: { requiresAuth: true },
      components:
          {
            layout: defaultLayout,
            content: () =>
                import(/* webpackChunkName: "admin" */ "./views/users-table")
          }
    }
  ]
});

router.beforeEach((to, from, next) => {
  if (to.name === "login-form" && auth.loggedIn(router.app.$store)) {
    next({ name: "home" });
  }

  if (to.matched.some(record => record.meta.requiresAuth)) {
    if (!auth.loggedIn(router.app.$store)) {
      next({
        name: "login-form",
        query: { redirect: to.fullPath }
      });
    } else {
      next();
    }
  } else {
    next();
  }
});

export default router;
