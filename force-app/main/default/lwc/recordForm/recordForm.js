import { api, track, wire, LightningElement } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import getProject from "@salesforce/apex/ProjectController.getProject";
import { getRecord } from "lightning/uiRecordApi";

import NAME_FIELD from "@salesforce/schema/Project__c.Name";
import DELIVERY_DATE_FIELD from "@salesforce/schema/Project__c.Delivery_Date__c";
// import PROJECT_OWNER_NAME_FIELD from '@salesforce/schema/Project__c.Owner.Name';
const fields = [NAME_FIELD, DELIVERY_DATE_FIELD];

export default class recordForm extends LightningElement {
  @track mode = "edit";
  @api recordId;
  @api objectApiName;
  recordFields = fields;

  connectedCallback() {
    console.log("record id --> ", this.recordId);
    this.fetchProject();
  }

  fetchProject() {
    getProject({ projectId: this.recordId })
      .then((data) => {
        console.log("project data -> ", this.printData(data));
      })
      .catch((error) => {
        console.log("data fetching error -> ", this.printData(error));
      });
  }

  @track record;
  @track error;
  @wire(getRecord, { recordId: "$recordId", fields: fields })
  wiredProject__c({ error, data }) {
    console.log("error -> ", error);
    console.log("data -> ", data);
    if (data) {
      this.record = data;
      this.error = undefined;
    } else if (error) {
      this.error = error;
      this.record = undefined;
    }
  }

  get name() {
    console.log("get name");
    return this.record?.fields?.Name?.value;
  }

  handleSubmit(event) {
    event.preventDefault(); // stop the form from submitting
    const fields2 = event.detail.fields;
    console.log("fields --> ", this.printData(fields2));

    //this.template.querySelector('lightning-record-form').submit(fields);
  }

  handleEvent() {
    this.dispatchEvent(
      new CustomEvent("modechange", {
        detail: "saved"
      })
    );
  }

  handleEdit() {
    this.mode = "edit";
  }

  handleView() {
    this.mode = "view";
  }

  handleReadOnly() {
    this.mode = "readonly";
  }

  handleSuccess(title) {
    this.showToast({
      isError: false,
      title: title,
      message: null
    });
  }

  handleError(error) {
    this.showToast({
      isError: true,
      title: "Error",
      message: error
    });
  }

  showToast(payload) {
    const event = new ShowToastEvent({
      title: payload.title,
      message: payload.message,
      variant: payload.isError ? "error" : "success",
      mode: "dismissable"
    });
    this.dispatchEvent(event);
  }

  printData(data) {
    return JSON.parse(JSON.stringify(data));
  }
}
