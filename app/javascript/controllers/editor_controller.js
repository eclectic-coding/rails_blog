import { Controller } from "@hotwired/stimulus";
import Editor from '@toast-ui/editor';

export default class extends Controller {
    static values = {
        url: String
    };

    connect() {
        // copy post to editor
        const initValue = document.getElementById('content-input').value
        const editor = new Editor({
            el: this.element,
            height: '500px',
            initialEditType: 'markdown',
            initialValue: initValue,
            previewStyle: 'vertical',
            events: {}
        });

        editor.getMarkdown();
        console.log(editor.getMarkdown());

        // copy changes in editor to hidden field
        editor.on('change', () => {
            document.getElementById('content-input')
                .setAttribute('value', editor.getMarkdown().replace(/(?:\r\n|\r|\n)/g, '\\k'));
        });
    }
}
