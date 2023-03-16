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

        // create hidden field for post content
        // const input = document.createElement('input');
        // input.setAttribute('type', 'hidden');
        // input.setAttribute('id', 'content');
        // input.setAttribute('name', 'post[content]');
        // input.setAttribute('value', '');
        // this.element.parentNode.insertBefore(input, this.element.nextSibling);

        // copy changes in editor to hidden field
        editor.on('change', () => {
            document.getElementById('content-input')
                .setAttribute('value', editor.getMarkdown().replace(/(?:\r\n|\r|\n)/g, '\\k'));
        });
    }
}
