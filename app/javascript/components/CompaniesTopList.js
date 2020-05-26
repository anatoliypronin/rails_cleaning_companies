import React from "react"
class CompaniesTopList extends React.Component {
  constructor(props) {
    super(props);
    this.state = { companies: [] }
  };

  fetchCompanies() {
    fetch('/api/v1/company')
      .then(response => response.json())
      .then(result => this.setState({companies: result}))
  };

  componentDidMount() {
    this.fetchCompanies();
  };

  render () {
    return (
      <React.Fragment>
        <div className='sidebar_box'>
          <h4 className='top_five_companies_title'>{ I18n.t('web.welcome.index.top_companies') }</h4>
          <ul className='top_companies'>
            { this.state.companies.slice(0, 5).map((company, index) => (
              <li key={ company.id }>
                <span className='placeholder'>
                  <em className='place'>{ index + 1 })</em>
                </span>
                <div className='top_companies_name'>
                  <a href="#">{ company.name }</a>
                </div>
                <div className='top_companies_rating'>
                  { I18n.t('web.welcome.index.rating') }: { company.rating }
                </div>
              </li>
            ))}
          </ul>
        </div>
      </React.Fragment>
    );
  }
}

export default CompaniesTopList
