class Signup extends React.Component {
  render() {
    return (
      <div>
        <h2>Signup</h2>
        <form>
          <input id='email' placeholder='email' />
          <input id='password' placeholder='password' />
          <button>Submit</button>
        </form>
        <button onClick={() => this.props.changePage('login')}>Log In!</button>
      </div>
    );
  }
}
