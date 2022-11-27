import { useContext, useState, useEffect } from 'react'
import { AuthContext } from '../providers/AuthProvider'

let timeout;

const Login = () => {
  const [email, setEmail] = useState('test@test.com')
  const [password, setPassword] = useState('123456')
  const [loading, setLoading] = useState(false)

  const auth = useContext(AuthContext)

  const handleSubmit = (e) => {
    e.preventDefault()
    auth.handleLogin({email, password})
    setLoading(true)
    timeout = setTimeout(() => {
      setLoading(false)
    }, 2000)
  }

  useEffect(() => {
    return () => {
      if(timeout){
        clearTimeout(timeout)
      }
    }
  }, [])

  return (
    <div>
      <h1>Login</h1>

      <form>
        <p>Email</p>
        <input value={email} onChange={(e) => setEmail(e.target.value)}/>

        <p>Password</p>
        <input value={password} type='password' onChange={(e) => setPassword(e.target.value)}/>

        <button onClick={handleSubmit} disabled={loading}>
          {loading ? '...loading' : 'Login'}
        </button>
      </form>
    </div>
  )
}

export default Login