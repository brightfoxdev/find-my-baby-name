import axios from 'axios'
import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom'

export const AuthContext = React.createContext()
export const AuthConsumer = AuthContext.Consumer

const AuthProvider = ({children}) => {
    const navigate = useNavigate()
    const [user, setUser] = useState(null)

    const handleRegister = async (user) => {
        console.log('going to create user in handleRegister:', user)
        try {
            let res = await axios.post('/api/auth', user)
            setUser(res.data.data)
            navigate('/home')
        } catch(err) {
            alert('error: unable to register, do you have a unique/valid email, is password greater than 6 characters?')
            console.log(err)
        }
    }

    const handleLogin = async (user) => {
        console.log('going to login user in handleLogin:', user)
        try {
            let res = await axios.post('/api/auth/sign_in', user)
            setUser(res.data.data)
            console.log('handleLogin hit in auth')
            navigate('/home')
        } catch(err) {
            alert('error logging in, is email and password valid?')
            console.log(err)
        }
    }

    const handleLogout = async () => {
        console.log('going to logout user in handleLogout:')
        try {
            let res = await axios.delete('/api/auth/sign_out')
            setUser(null)
        } catch(err) {
            alert('error logging out, did you send the token?')
            console.log(err)
        }
    }

    return (
        <AuthContext.Provider value={{ user, setUser, handleRegister, handleLogin, handleLogout }}>
            {children}
        </AuthContext.Provider>
    )

}

export default AuthProvider
