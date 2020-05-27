import React from "react"

class CompanyAuthorization extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      isVisible: false
    };
    this.onToggle = this.onToggle.bind(this);
  }

  onToggle(e) {
    this.setState({isVisible: !this.state.isVisible});
  }

  render() {
    return (
      <React.Fragment>
        <a href='javascript:void(0)' onClick={this.onToggle}> { I18n.t('layouts.welcome.header.company_authorization') } </a>
          {this.state.isVisible &&
            <div className='popup'>
              <div className="form_container">
                <form className="form_contact" action="" method="post">
                  <h3>{ I18n.t('layouts.welcome.header.company_authorization') }</h3>
                  <fieldset>
                    <input placeholder={ I18n.t('auth.email') } type="email" required/>
                  </fieldset>
                  <fieldset>
                    <input placeholder={ I18n.t('auth.password') } type="password" required/>
                  </fieldset>
                  <fieldset>
                    <button name="submit" type="submit" className='form_button_submit'>{ I18n.t('auth.authorization') }</button>
                  </fieldset>
                  <fieldset>
                    <button name="submit" type="submit" className='form_button_cancel' onClick={this.onToggle} >{ I18n.t('auth.cancel') }</button>
                  </fieldset>
                </form>
              </div>
            </div>
          }
      </React.Fragment>
    );
  }
}

export default CompanyAuthorization