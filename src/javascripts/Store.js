import { createStore } from 'redux';

const Store = createStore((state = {}, action) => {
    switch (action.type) {
        default:
            return state;
    }
});