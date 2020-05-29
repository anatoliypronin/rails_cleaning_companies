import React from 'react'
class ArticlesList extends React.Component {
  constructor(props) {
    super(props);
    this.state = { articles: [] }
  };

  fetchArticles() {
    fetch('/api/v1/article')
      .then(response => response.json())
      .then(result => this.setState({
        articles: result,
        scope: 3
      }))
      this.loadMore = this.loadMore.bind(this);
  };

  componentDidMount() {
    this.fetchArticles();
  };

  formatedDateDay(datetime) {
    return new Date(datetime).getDate();
  }

  formatedDateMonth(datetime) {
    var date = new Date(datetime);
    return date.toLocaleString('en-US', { month: 'long' });
  }

  loadMore() {
    this.setState(old => {
      return {scope: old.scope + 2}
    })
  }

  render () {
    return (
      <React.Fragment>
        <div className='sidebar_box'>
          <h4>{ I18n.t('web.welcome.index.last_articles') }</h4>
          <ul className='latest-posts'>
            { this.state.articles.slice(0, this.state.scope).map(article => (
              <li key={ article.id }>
                <span className='date'>
                  <em className='day'>{ this.formatedDateDay(article.created_at) }</em>
                  <em className='month'>{ this.formatedDateMonth(article.created_at) }</em>
                </span>
                <div className='article_title'>
                  <a href={"/blog/articles/" + article.id}>{ article.title }</a>
                </div>
                <div className='article_author'>
                  { I18n.t('web.welcome.index.author') }: { article.author.name }
                </div>
                <div className='article_short_description'>
                  { article.short_description.substr(0, 70) }...
                </div>
              </li>
            ))}
          </ul>
          <div>
            {
              this.state.scope < this.state.articles.length &&
              <button type='button' className="button" onClick={this.loadMore}>{ I18n.t('web.welcome.index.load_more') }</button>
            }
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default ArticlesList
