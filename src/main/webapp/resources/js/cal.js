// ================================
// START YOUR APP HERE
// ================================
const init = {
	dayList: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	today: new Date(),
	monForChange: new Date().getMonth(),
	activeDate: new Date(),
	getFirstDay: (yy, mm) => new Date(yy, mm, 1),
	getLastDay: (yy, mm) => new Date(yy, mm + 1, 0),
	nextMonth: function () {
		let d = new Date();
		d.setDate(1);
		d.setMonth(++this.monForChange);
		this.activeDate = d;
		return d;
	},
	prevMonth: function () {
		let d = new Date();
		d.setDate(1);
		d.setMonth(--this.monForChange);
		this.activeDate = d;
		return d;
	},
	addZero: (num) => (num < 10) ? '0' + num : num,
	activeDTag: null,
	getIndex: function (node) {
		let index = 0;
		while (node = node.previousElementSibling) {
			index++;
		}
		return index;
	}
};

const $calBody = document.querySelector('.cal-body');
const $btnNext = document.querySelector('.btn-cal.next');
const $btnPrev = document.querySelector('.btn-cal.prev');

/**
* @param {number} date
* @param {number} dayIn
*/
function loadDate (today_date, date, day) {
	$("#today_date_string").val(today_date);
	$("#date_string").val(date);
	$("#day_string").val(day);

	var today_timestamp = new Date(today_date).getTime() / 1000;
	var date_timestamp = new Date(date).getTime() / 1000;

	if(Number(today_timestamp) > Number(date_timestamp)) {
		$("#date_day_time").text("해당날짜는 예약이 불가능합니다.");
		$("#base_price").text("0");
		$("#add_infotext").text("");
		$("#add_price").text("0");
		$("#total_price_text").text("0");
		$("input:radio[name='part_time']").prop('checked', false);
		$("input:radio[name='part_time']").attr('disabled', true);
		$("#addPeople").val("0").prop("selected", true);
		$("#addPeople").attr("disabled", true);
	} else if(Number(today_timestamp) == Number(date_timestamp)) {
		$("#date_day_time").text("해당날짜는 예약이 불가능합니다.");
		$("#base_price").text("0");
		$("#add_infotext").text("");
		$("#add_price").text("0");
		$("#total_price_text").text("0");
		$("input:radio[name='part_time']").prop('checked', false);
		$("input:radio[name='part_time']").attr('disabled', true);
		$("#addPeople").val("0").prop("selected", true);
		$("#addPeople").attr("disabled", true);
	} else {
		$("#date_day_time").text($("#date_string").val() + " " + $("#day_string").val());
		$("input:radio[name='part_time']").prop('checked', false);
		$("input:radio[name='part_time']").attr('disabled', false);
		$("#addPeople").attr("disabled", true);
		$("#base_price").text("0");
		$("#base_unit").text("원");
		$("#add_infotext").text("");
		$("#addPeople").val("0").prop("selected", true);
		$("#add_price").text("0");
		$("#total_price_text").text("0");
	}
}

/**
* @param {date} fullDate
*/
function loadYYMM (fullDate) {
	let yy = fullDate.getFullYear();
	let mm = fullDate.getMonth();
	let firstDay = init.getFirstDay(yy, mm);
	let lastDay = init.getLastDay(yy, mm);
	let markToday;  // for marking today date

	if (mm === init.today.getMonth() && yy === init.today.getFullYear()) {
		markToday = init.today.getDate();
	}

	document.querySelector('.cal-month').textContent = init.addZero(mm + 1);
	document.querySelector('.cal-year').textContent = yy;

	let trtd = '';
	let startCount;
	let countDay = 0;
	for (let i = 0; i < 6; i++) {
		trtd += '<tr>';
		for (let j = 0; j < 7; j++) {
			if (i === 0 && !startCount && j === firstDay.getDay()) {
				startCount = 1;
			}
			if (!startCount) {
				trtd += '<td>'
			} else {
				let fullDate = yy + '-' + init.addZero(mm + 1) + '-' + init.addZero(countDay + 1);
				if(j === 0) {
					trtd += '<td class="day';
					trtd += (markToday && markToday === countDay + 1) ? ' today color_red" ' : ' color_red"';
					trtd += ` data-date="${countDay + 1}" data-fdate="${fullDate}">`;
				} else if (j === 6) {
					trtd += '<td class="day';
					trtd += (markToday && markToday === countDay + 1) ? ' today color_blue" ' : ' color_blue"';
					trtd += ` data-date="${countDay + 1}" data-fdate="${fullDate}">`;
				} else {
					trtd += '<td class="day';
					trtd += (markToday && markToday === countDay + 1) ? ' today" ' : '"';
					trtd += ` data-date="${countDay + 1}" data-fdate="${fullDate}">`;
				}
			}
			trtd += (startCount) ? ++countDay : '';
			if (countDay === lastDay.getDate()) { 
				startCount = 0; 
			}
			trtd += '</td>';
		}
		trtd += '</tr>';
	}
	$calBody.innerHTML = trtd;
}

/**
* @param {string} val
*/
function createNewList (val) {
	let id = new Date().getTime() + '';
	let yy = init.activeDate.getFullYear();
	let mm = init.activeDate.getMonth() + 1;
	let dd = init.activeDate.getDate();

	let date = yy + '-' + init.addZero(mm) + '-' + init.addZero(dd);

	let eventData = {};
	eventData['date'] = date;
	eventData['memo'] = val;
	eventData['complete'] = false;
	eventData['id'] = id;
	init.event.push(eventData);
	$todoList.appendChild(createLi(id, val, date));
}

loadYYMM(init.today);
loadDate(
	init.today.getFullYear() + "-" + init.addZero((init.today.getMonth() + 1)) + "-" + init.addZero(init.today.getDate()),
	init.today.getFullYear() + "-" + init.addZero((init.today.getMonth() + 1)) + "-" + init.addZero(init.today.getDate()), 
	init.dayList[init.today.getDay()]);

$btnNext.addEventListener('click', () => loadYYMM(init.nextMonth()));
$btnPrev.addEventListener('click', () => loadYYMM(init.prevMonth()));

$calBody.addEventListener('click', (e) => {
	if (e.target.classList.contains('day')) {
		if (init.activeDTag) {
			init.activeDTag.classList.remove('day-active');
		}
		let day = init.addZero(Number(e.target.textContent));
		let year = document.querySelector('.cal-year').textContent
		let month = document.querySelector('.cal-month').textContent;
		let year_month_day = year + "-" + month + "-" + day;
		let today_date = init.today.getFullYear() + "-" + init.addZero((init.today.getMonth() + 1)) + "-" + init.addZero(init.today.getDate());
		loadDate(today_date, year_month_day, init.dayList[e.target.cellIndex]);
		e.target.classList.add('day-active');
		init.activeDTag = e.target;
		init.activeDate.setDate(day);
	}
});