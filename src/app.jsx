import styles from './stylesheets/index.scss';
import React, { Component } from 'react';

class App extends Component {
    render() {
        return (
            <div className={styles.container}>
                Hello, Jafart!
            </div>
        );
    }
}

export default App;