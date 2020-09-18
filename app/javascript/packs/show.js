const urlArr = window.location.href.split('/');
const id = urlArr[urlArr.length - 1]

fetch(`/api/v1/courses/${id}`, {
  method: 'GET',
  headers: {
    'Content-Type': 'application/json'
  }
})
  .then((res) => res.json())
  .then((body) => {
    let title = document.querySelector('.card-title')
    let courseType = document.querySelector('.course-type')
    let text = document.querySelector('.card-text')
    let price = document.querySelector('.price')
    let warning = document.querySelector('.alert-warning')
    let info = document.querySelector('.alert-info')
    title.innerHTML = body.title
    courseType.innerHTML = body.course_type
    text.innerHTML = body.description
    price.innerHTML = body.currency + ": " + body.price
    warning.innerHTML = "Online : " + body.is_available
    info.innerHTML = "Expiry Day : " + body.expiry_day
  })