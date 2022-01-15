import consumer from "./consumer"

consumer.subscriptions.create("AmountSoldChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const applicationElement = document.querySelector("div.product_list")
    if (applicationElement) {
      applicationElement.innerHTML = data.sold
    }
  }
});
