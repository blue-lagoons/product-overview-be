import http from "k6/http";
import { check, sleep } from "k6";
import { Rate } from "k6/metrics";

export let errorRate = new Rate("errors");


// user visits 150 product pages
// export default function () {
//   var url = `http://localhost:3000/products/${Math.ceil(Math.random() * 1000000)}`;
//   for (let i = 0; i < 150; i++){
//       check(http.get(url), {
//         "status is 200": (r) => r.status == 200,
//       }) || errorRate.add(1);
//       sleep(0.1);
//   }
// }

// user visits 1 product page
export default function () {
  var url = `http://localhost:3000/products/${Math.ceil(Math.random() * 1000000)}`;
  check(http.get(url), {
    "status is 200": (r) => r.status == 200,
  }) || errorRate.add(1);
}

export let options = {
    stages: [
        // { duration: '5s', target: 10},
        { duration: '25s', target: 2500},
        // { duration: '5s', targer: 0}
    ],
    throw: true,         // throw errors on failed HTTP requests
    // discardResponseBodies: true, //discard repsponse bodies to lessen the amount of mem required
    thresholds: { 
        http_req_duration: ["max<2000"],
        errors: ["rate<0.1"], // test passes if error rate is less than 10 %
    },
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