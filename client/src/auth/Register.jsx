import { useContext, useEffect, useState } from 'react'
import { AuthContext } from '../providers/AuthProvider'

let timeout;

const Register = () => {
    const [email, setEmail] = useState('test@test.com')
    const [password, setPassword] = useState('123456')
    const [loading, setLoading] = useState(false)
    const [name, setName] = useState()

    const auth = useContext(AuthContext)

    const handleSubmit = (e) => {
        e.preventDefault()
        auth.handleRegister({email, password, name})
        setLoading(true)
        timeout = setTimeout (() => {
            setLoading(false)
        }, 2000)
    }

    useEffect(() => {
        return () => {
            if(timeout) {
                clearTimeout(timeout)
            }
        }
    }, [])

  return (
    <div>
        <h1>Sign-up for Find My Baby Name</h1>
        <form>
            <p>Name</p>
            <input value={name} onChange={(e) => setName(e.target.value)}/>

            <p>Email</p>
            <input value={email} onChange={(e) => setEmail(e.target.value)}/>

            <p>Password</p>
            <input value={password} type='password' onChange={(e) => setPassword(e.target.value)}/>
            <Button onClick={handleSubmit} disabled={loading}>
                {loading ? 'Loading...' : 'Register'}
            </Button>
        </form>
    </div>
  )
}

export default Register