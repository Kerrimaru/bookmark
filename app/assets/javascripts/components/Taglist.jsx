class Taglist extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tags: props.tags
    };
  }

  render() {
    return (
      <div className='tag-list'>
        {this.state.tags.map(tag => (
          <span className='main-tag' key={tag.id}>
            <a href='tag.tag'>{tag.tag}</a>
          </span>
        ))}
      </div>
    );
  }
}
