var slides = document.querySelectorAll('.slide');
var currentSlide = 0;
var slideInterval = setInterval(nextSlide, 3000);

function nextSlide() {
    slides[currentSlide].classList.remove('active');
    currentSlide = (currentSlide + 1) % slides.length;
    slides[currentSlide].classList.add('active');
}

function previousSlide() {
    slides[currentSlide].classList.remove('active');
    currentSlide = (currentSlide - 1 + slides.length) % slides.length;
    slides[currentSlide].classList.add('active');
}

function resetInterval() {
    clearInterval(slideInterval);
    slideInterval = setInterval(nextSlide, 5000);
}

var previousButton = document.querySelector('.arrow-button.arrow-left');
var nextButton = document.querySelector('.arrow-button.arrow-right');
previousButton.addEventListener('click', function() {
    previousSlide();
    resetInterval();
});
nextButton.addEventListener('click', function() {
    nextSlide();
    resetInterval();
});
