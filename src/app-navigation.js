export default [
  {
    text: "Home",
    path: "/home",
    icon: "home"
  },
  {
    text: "Tables",
    icon: "folder",
    items: [
      {
        text: "Money M2",
        path: "/money_m2"
      },
      {
        text: "Population",
        path: "/people"
      }
    ]
  }, 
  {
    text: 'GDP Growth',
    path: '/gdp_growth',
    icon: "folder"
  },
  {
    text: "Admin",
    role: "Admin",
    icon: "folder",
    items: [
      {
        text: "Users",
        path: "/users"
      },
    ]
  },
];
