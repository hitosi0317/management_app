function check() {
  const plans = document.querySelectorAll(".plan");
  plans.forEach(function (plan) { 
    if (plan.getAttribute("data-load") != null) {
      return null;
    }
    plan.setAttribute("data-load", "true");
    plan.addEventListener("click", () => { 
    const planId =  plan.getAttribute("data-id");
    const XHR = new XMLHttpRequest();
    XHR.open("GET", `/motion/${planId}`, true);
    XHR.responseType = "json";
    XHR.send();
    XHR.onload = () => {
      if(XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.plan;
      if (item.checked === true) {
        plan.setAttribute("data-check", "true");
      } else if (item.checked === false) {
        plan.removeAttribute("data-check");
      }
    };
    });
  });
}
setInterval(check, 1000);