import axios from "axios"


//const fullPath = 'http://localhost:8080';

const fullPath = location.protocol + '//' + location.host;
const userMe='https://scholar.googleusercontent.com/citations?view_op=view_photo&user=nKNZLU4AAAAJ&citpid=1';
const sif='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQ5t9tNcC1mDp3SZSZNJe7g6aGa38PeE27-ZYMR9PcEHvUlM3p83oyTw1EwO06Nwbx4fA&usqp=CAU';
const adminPages = ["Admin"];

const defaultUser = {
    username: 'siforeca@gmail.com',
    avatarUrl: sif
};



export default {
    _user: defaultUser,
    storage: null,

     loggedIn() {
         return true
     },

    //loggedIn(storage) {
    //    if (!this.storage) this.storage=storage;
    //    return this.storage.getters.getLogged
    //},


    filterMenuForUserRole(storage, list) {
        if (this.loggedIn(storage)) return list;
            return  list.filter(x=> !adminPages.includes(x.role));
    },


    async logIn(email, password, storage) {
        return axios.post(fullPath+"/user/signin?username="+email+"&password="+password, {})
            .then(res=> {
                if (res.data.length<100) {
                    storage.dispatch("setToken", "");
                    return {
                        isOk: false,
                        message: "Authentication failed"
                    };
                }
                storage.dispatch("setToken", res.data);
                storage.commit("SET_LOGGED", true);
                this._user = {username: email,  avatarUrl: sif};
                return {
                    isOk: true,
                    data: this._user
                };
            })
            .catch(()=> {
                storage.dispatch("setToken", "");
                return {
                    isOk: false,
                    message: "Authentication failed"
                };
            });
    },

    async logOut(storage) {
        let token = storage.getters.getToken;
        this._user=defaultUser;
        storage.commit("SET_LOGGED", false);
        storage.dispatch("setToken", "");
        return axios.get(fullPath+"/user/logout",{
            headers: {
                "Authorization": "Bearer "+token
            }
        })
            .then(()=> {
                return {
                    isOk: true,
                }
            })
            .catch(()=> {
                return {
                    isOk: false,
                }
            });
    },

    async getUser(storage) {
        if (!this.loggedIn(storage))
            return new Promise((res) => {
                res({
                    isOk: true,
                    data: defaultUser
                })});
        let token = storage.getters.getToken;
        return axios.get(fullPath+"/user/whoami",{
            headers: {
                "Authorization": "Bearer "+token
            }
        })
            .then(res=> {
                return {
                    isOk: true,
                    data: {
                        username: res.data.username,
                        avatarUrl: userMe
                    }}
            })
            .catch(()=> {
                return {
                    isOk: false,
                    data: defaultUser
                };
            });
    },

    async resetPassword(email) {
        return axios.post(fullPath+"/user/reset?email="+email, {})
            .then(()=> {
                return {
                    isOk: true,
                    message: "E-mail was sent for confirmation"
                };
            })
            .catch((error)=> {
                console.log(error.response.status);
                return {
                    isOk: false,
                    message: error.response.data
                };
            });
    },

    async changePassword(password, recoveryCode) {
        let token=recoveryCode.substr(recoveryCode.indexOf("=")+1);
        return axios.post(fullPath+"/user/change?token="+token+"&password="+password, {})
            .then(()=> {
                return {
                    isOk: true,
                    message: "Password changed successfully"
                };
            })
            .catch((error)=> {
                console.log(error.response.status);
                return {
                    isOk: false,
                    message: error.response.data
                };
            });
    },

    async createAccount(email, password) {
        return axios.post(fullPath+"/user/signup?username="+email+"&password="+password, {})
            .then(res=> {
                console.log(res.statusText);
                return {
                    isOk: true,
                    message: "E-mail was sent for confirmation"
                };
            })
            .catch((error)=> {
                console.log(error.response.status);
                return {
                    isOk: false,
                    message: error.response.data
                };
            });
    }
};
