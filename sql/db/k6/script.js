import http from "k6/http";
import { check, sleep } from "k6";
import { Rate } from "k6/metrics";

export let errorRate = new Rate("errors");



export default function () {
  var url = `http://localhost:3000/products/${Math.ceil(Math.random() * 1000000)}`;
  for (let i = 0; i < 150; i++){
      check(http.get(url), {
        "status is 200": (r) => r.status == 200,
      }) || errorRate.add(1);
      sleep(0.01);
    }
  }

export let options = {
    stages: [
        { duration: '5s', target: 10},
        { duration: '10s', target: 500},
        { duration: '5s', targer: 0}
    ],
    throw: true,         // throw errors on failed HTTP requests
    // discardResponseBodies: true, //discard repsponse bodies to lessen the amount of mem required
    thresholds: {http_req_duration: ["max<2000"]},
};





// ======= g

// export let options = {
//   vus: 60,
//   thresholds: {
//     http_req_duration: ["max<2000"],
//   },
//   duration: "20s",
//   throw: true,
// };

// export default function () {
//   var url = `http://localhost:3000/products/${Math.ceil(Math.random() * 1000000)}`;
//   for (let i = 0; i < 120; i++) {
//     check(http.get(url), {
//       "status is 200": (r) => r.status == 200,
//     }) || errorRate.add(1);
//     sleep(0.01);
//   }
// }