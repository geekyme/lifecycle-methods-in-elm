import './main.css';
import { Main } from './Main.elm';
import registerServiceWorker from './registerServiceWorker';

const app = Main.embed(document.getElementById('root'));

registerServiceWorker();

app.ports.initLibrary.subscribe(function(elementId) {
    const node = document.getElementById(elementId);

    console.log("Ready to do funny stuff on: ", node)
});
