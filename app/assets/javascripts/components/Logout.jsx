class Logout extends React.Component {
  handleLogout(e) {
    e.preventDefault();
    window.fetch('http://localhost:3000/users/sign_out', {
      method: 'DELETE',
      dataType: 'json',
      error: function(error) {
        console.log(error);
      },
      success: function(res) {
        that.props.changePage('login');
      }
    });
  }

  render() {
    return <button onClick={e => this.handleLogout(e)}>Sign Out</button>;
  }
}
