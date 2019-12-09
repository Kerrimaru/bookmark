// var Login = React.createClass({
//     render: function() {
//       return (
//        <div>
//         <h2>Login</h2>
//         <form>
//          <input id='email’ placeholder=’email’/>
//          <input id=’password’ placeholder=’password’/>
//          <button>Submit</button>
//         </form>
//         <button onClick={()=>this.props.changePage(‘signup’)}>Sign   Up!</button>
//        </div>
//       )
//      }
//    });

class Login extends React.Component {
  render() {
    return (
      <div>
        <h2>Login</h2>
        <form>
          <input id='email' placeholder='email' />
          <input id='password' placeholder='password' />
          <button>Submit</button>
        </form>
        <button onClick={() => this.props.changePage('signup')}>
          Sign Up!
        </button>
      </div>
    );
  }
}
