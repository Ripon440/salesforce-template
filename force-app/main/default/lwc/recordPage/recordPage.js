import { api, LightningElement, track } from "lwc";

export default class RecordPage extends LightningElement {
  @api recordId;
  @api objectApiName;
  @track isEdit;

  handleModeChange(event) {
    console.log("event.detail --> ", event.detail);
  }

  handleEdit() {
    this.isEdit = !this.isEdit;
  }
}
