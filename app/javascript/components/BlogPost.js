import React from "react"
class BlogPost extends React.Component {
  constructor(props) {
    super(props);
    this.state = { article: '' }
  };

  fetchArticles() {
    fetch('/api/v1/article/' + this.getArticleId())
      .then(response => response.json())
      .then(result => this.setState({
        article: result,
      }))
  };

  componentDidMount() {
    this.fetchArticles();
  };

  formatedDateDay(datetime) {
    return new Date(datetime).getDate();
  }

  formatedDateYear(datetime) {
    return new Date(datetime).getFullYear();
  }

  getArticleId() {
    var id = location.pathname.match(/\/articles\/(.*)/)[1];
    return id;
  }

  formatedDateMonth(datetime) {
    var date = new Date(datetime);
    return date.toLocaleString('en-US', { month: 'long' });
  }

  render () {
    return (
      <React.Fragment>
        <div className="post">
          <div className="post-info">
            <div className="post-date">
              <span className="day">{ this.formatedDateDay(this.state.article.created_at) }</span>
              <span className="month">{ this.formatedDateMonth(this.state.article.created_at) }</span>
              <span className="year">{ this.formatedDateYear(this.state.article.created_at) }</span>
            </div>
            <div className="post-title">
              <h1><a href={"/blog/articles/" + this.state.article.id}>{ this.state.article.title }</a></h1>
            </div>
          </div>
          <div className="post-text">
            <p>{ this.state.article.description }</p>
          </div>
        </div>
     </React.Fragment>
    );
  }
}

export default BlogPost
