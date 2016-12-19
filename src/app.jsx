import styles from './stylesheets/index.scss';
import React, { Component, PropTypes } from 'react';

class App extends Component {
    render() {
        return (
            <div className={styles.container}>
                Hello
            </div>
        );
    }
}

export default App;