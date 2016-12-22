import styles from './stylesheets/index.scss';
import React, { Component } from 'react';

class App extends Component {
    render() {
        let divStyle = {
            display: 'flex',
            justifyContent: 'space-between',
            marginBottom: '15px'
        };

        let otherDivStyle = {
            display: 'flex',
            flexDirection: 'column'
        }

        let searchOptions = [ 'all', 'tag', 'name', 'url', 'date' ];
        return (
            <div className={styles.container}>
                <h1>Pouch</h1>
                <form className={styles.formGroup}>
                    <div style={otherDivStyle}>
                        <div style={divStyle}>
                            <input 
                                type="text" 
                                placeholder="Search for something" 
                                className={styles.formControl}/>
                            <select className={styles.formControl} style={{width:'25%'}}>
                                {searchOptions.map(option => {
                                    return <option value={option} key={option}>
                                        {option[0].toUpperCase() + option.slice(1)}
                                    </option>
                                })}
                            </select>
                            <select className={styles.formControl} style={{width:'25%'}}>
                                <option value="standard">Standard</option>
                                <option value="regex">Regex</option>
                            </select>
                            <div className={styles.btn + ' ' + styles.btnSuccess}>+</div>
                            <div className={styles.btn + ' ' + styles.btnDanger}>-</div>
                        </div>
                    </div>
                </form>
                <h2>Links</h2>
                <hr/>
                <ul>
                    <li>https://google.com</li>
                </ul>
            </div>
        );
    }
}

export default App;