<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="titles" required="true" rtexprvalue="true" type="java.util.List<java.lang.String>"
description="it represents the columns titles" %>
<%@ tag description="My Custom Component" pageEncoding="UTF-8" %>
<script src="https://cdn.tailwindcss.com"></script>
<div class="flex flex-col p-5 h-screen overflow-hidden">
    <div class="flex flex-col gap-3 w-fit max-w-full">
        <div class="flex flex-col gap-2 sm:flex-row sm:justify-between">
            <div
                class="flex items-center gap-3 font-bold text-gray-700 rounded-md px-3 py-1 bg-gray-200 cursor-pointer"
            >
                Agregar Filtro <i class="fa-solid fa-plus"></i>
            </div>
            <div class="flex gap-2 items-center">
                <label>Search</label>
                <input
                    id="search-input"
                    type="text"
                    class="border outline-indigo-600"
                />
            </div>
        </div>
        <div
            id="table-container"
            class="overflow-y-scroll rounded-lg border"
        >
            <table
                id="table"
                class="table-auto [&_td]:py-2 [&_th]:py-2 min-w-[700px]"
            >
                <thead
                    class="bg-gray-200 [&_>_*]:cursor-pointer [&_>_*]:font-semibold"
                >
                    <th>
                        <div class="flex items-center gap-2 ps-3">
                            <span>Lorem.</span
                            ><i
                                class="text-[10px] bg-[#f3f4f6] rounded-sm p-1 text-black fa-solid fa-chevron-up hidden"
                            ></i
                            ><i
                                class="text-[10px] bg-[#f3f4f6] rounded-sm p-1 text-black fa-solid fa-chevron-down hidden"
                            ></i>
                        </div>
                    </th>
                    <th>
                        <div class="flex items-center gap-2 ps-3">
                            <span>Veniam.</span
                            ><i
                                class="text-[10px] bg-[#f3f4f6] rounded-sm p-1 text-black fa-solid fa-chevron-up hidden"
                            ></i
                            ><i
                                class="text-[10px] bg-[#f3f4f6] rounded-sm p-1 text-black fa-solid fa-chevron-down hidden"
                            ></i>
                        </div>
                    </th>
                    <th>
                        <div class="flex items-center gap-2 ps-3">
                            <span>Est.</span
                            ><i
                                class="text-[10px] bg-[#f3f4f6] rounded-sm p-1 text-black fa-solid fa-chevron-up hidden"
                            ></i
                            ><i
                                class="text-[10px] bg-[#f3f4f6] rounded-sm p-1 text-black fa-solid fa-chevron-down hidden"
                            ></i>
                        </div>
                    </th>
                    <th>
                        <div class="flex items-center gap-2 ps-3">
                            <span>Tenetur.</span
                            ><i
                                class="text-[10px] bg-[#f3f4f6] rounded-sm p-1 text-black fa-solid fa-chevron-up hidden"
                            ></i
                            ><i
                                class="text-[10px] bg-[#f3f4f6] rounded-sm p-1 text-black fa-solid fa-chevron-down hidden"
                            ></i>
                        </div>
                    </th>
                    <th>
                        <div class="flex items-center gap-2 ps-3 pe-3">
                            <span>Adipisci?</span
                            ><i
                                class="text-[10px] bg-[#f3f4f6] rounded-sm p-1 text-black fa-solid fa-chevron-up hidden"
                            ></i
                            ><i
                                class="text-[10px] bg-[#f3f4f6] rounded-sm p-1 text-black fa-solid fa-chevron-down hidden"
                            ></i>
                        </div>
                    </th>
                </thead>
                <tbody
                    class="[&_td]:border-t last:[&_td]:text-indigo-600 last:[&_td]:underline last:[&_td]:cursor-pointer rounded-sm [&_td]:text-gray-500 first:[&_td]:font-semibold first:[&_td]:text-black [&_td]:ps-3 [&_td]:pe-3 [&_tr]:hidden first:[&_tr]:table-row"
                >
                    <tr id="spinner">
                        <td colspan="5">
                            <div
                                role="status"
                                class="flex justify-center items-center"
                            >
                                <svg
                                    aria-hidden="true"
                                    class="w-8 h-8 mr-2 text-gray-200 animate-spin dark:text-gray-600 fill-blue-600"
                                    viewBox="0 0 100 101"
                                    fill="none"
                                    xmlns="http://www.w3.org/2000/svg"
                                >
                                    <path
                                        d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z"
                                        fill="currentColor"
                                    />
                                    <path
                                        d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z"
                                        fill="currentFill"
                                    />
                                </svg>
                                <span class="sr-only">Loading...</span>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>Lorem.</td>
                        <td>Labore.</td>
                        <td>Quaerat.</td>
                        <td>Perferendis.</td>
                        <td>Perferendis.</td>
                    </tr>
                    <tr>
                        <td>Lorem.</td>
                        <td>Atque.</td>
                        <td>Voluptas.</td>
                        <td>Nisi.</td>
                        <td>Distinctio?</td>
                    </tr>
                    <tr>
                        <td>Lorem.</td>
                        <td>Placeat.</td>
                        <td>Impedit.</td>
                        <td>Molestias.</td>
                        <td>Error!</td>
                    </tr>
                    <tr>
                        <td>Lorem.</td>
                        <td>Voluptatem.</td>
                        <td>Molestias?</td>
                        <td>Facilis?</td>
                        <td>Voluptates?</td>
                    </tr>
                    <tr>
                        <td>Lorem.</td>
                        <td>Nostrum.</td>
                        <td>Fuga?</td>
                        <td>Deserunt.</td>
                        <td>Repudiandae?</td>
                    </tr>
                    <tr>
                        <td>Lorem.</td>
                        <td>Vel.</td>
                        <td>Aperiam!</td>
                        <td>Eum.</td>
                        <td>Molestiae.</td>
                    </tr>
                    <tr>
                        <td>Lorem.</td>
                        <td>Aut!</td>
                        <td>Repellendus.</td>
                        <td>Alias.</td>
                        <td>Reiciendis.</td>
                    </tr>
                    <tr>
                        <td>Lorem.</td>
                        <td>Rem.</td>
                        <td>Soluta!</td>
                        <td>Corrupti.</td>
                        <td>Deserunt.</td>
                    </tr>
                    <tr>
                        <td>Lorem.</td>
                        <td>Illo.</td>
                        <td>Earum?</td>
                        <td>Dolores!</td>
                        <td>Tenetur!</td>
                    </tr>
                    <tr>
                        <td>Lorem.</td>
                        <td>Reprehenderit.</td>
                        <td>Voluptates?</td>
                        <td>Et.</td>
                        <td>Quasi!</td>
                    </tr>
                    <tr>
                        <td>Lorem.</td>
                        <td>Consectetur.</td>
                        <td>Maiores!</td>
                        <td>Explicabo!</td>
                        <td>Aspernatur.</td>
                    </tr>
                    <tr>
                        <td>Lorem.</td>
                        <td>Ea!</td>
                        <td>Repellat!</td>
                        <td>Omnis!</td>
                        <td>Pariatur?</td>
                    </tr>
                    <tr>
                        <td>Lorem.</td>
                        <td>Animi?</td>
                        <td>Aliquid!</td>
                        <td>Sit.</td>
                        <td>Quae.</td>
                    </tr>
                    <tr>
                        <td>Lorem.</td>
                        <td>Quidem!</td>
                        <td>Libero.</td>
                        <td>Natus!</td>
                        <td>Numquam.</td>
                    </tr>
                    <tr>
                        <td>Lorem.</td>
                        <td>Impedit.</td>
                        <td>Natus.</td>
                        <td>Sint.</td>
                        <td>Quisquam.</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div
            class="flex flex-col gap-3 sm:flex-row sm:justify-between w-full sm:items-center border p-2"
        >
            <span id="showing-message">Showing 1 out of 3</span>
            <div class="flex gap-2">
                <button
                    id="previous-button"
                    class="hover:bg-gray-100 active:bg-indigo-600 px-2"
                >
                    Previous
                </button>
                <div
                    id="container-buttons-pagination"
                    class="flex hover:[&_*]:bg-gray-100 hover:[&_*.bg-indigo-600]:bg-indigo-700"
                ></div>
                <button
                    id="next-button"
                    class="hover:bg-gray-100 active:bg-indigo-600 px-2"
                >
                    Next
                </button>
            </div>
        </div>
    </div>
</div>


<script>
const state = {
currentPagination: 1,
rowsNeeededToHide: [],
};
const searchInput = document.getElementById("search-input");
const table = document.getElementById("table");
const tbody = table.querySelector("tbody");
const MAX_TUPLES = 5;

const getHTMLHighlighted = (str, searchValue) => {
if (searchValue === "") return [str, true];

// return str.replace(/<span class="bg-indigo-600">(.*?)<\/span>/g, "$1");
const value = str.match(new RegExp(searchValue, "i"));
if (!value) return [str, false];
const [match] = value;
return [
str.replace(match, `<span class="bg-indigo-600">${match}</span>`),
true,
];
};

const getRowsThatDontMatchSearch = (rows, searchValue) =>
rows.filter((row) => {
const cells = [...row.children];

// TO AVOID ACTIONS MATCHING THE SEARCH VALUE
cells.pop();

console.log(cells.length);

const someMatch = cells.reduce((someMatch, cell) => {
const textValue = cell.textContent.trim();
const [html, match] = getHTMLHighlighted(textValue, searchValue);
cell.innerHTML = html;
if (match) return match;
return someMatch;
// return textValue !== cell.innerHTML || textValue !== "";
}, false);

return !someMatch;
});

const hideTuples = (tuples, MAX_TUPLES, pagination = 1, set = new Set()) => {
if (tuples.length < MAX_TUPLES) return;

const filteredTuples = tuples.filter((element) => {
if (set.has(element)) element.classList.add("hidden");
return !set.has(element);
});
filteredTuples.forEach((element, i) => {
element.classList.remove("hidden");
if (i >= MAX_TUPLES * pagination - 5 && i < MAX_TUPLES * pagination) return;

element.classList.add("hidden");
});
document.getElementById("showing-message").textContent = `Showing ${
MAX_TUPLES * (pagination - 1) + 1
} to ${Math.min(MAX_TUPLES * pagination, tuples.length)} out of ${
tuples.length
} results`;
};

const makeOddRowsDistinguishable = () => {
[...tbody.querySelectorAll("tr:not(.hidden):not(#spinner)")].forEach(
(row, i) => {
row.classList.remove("bg-gray-100");
if (i % 2 === 1) row.classList.add("bg-gray-100");
},
);
};

document.addEventListener("click", (e) => {
const table = document.getElementById("table");
const th = e.target.closest("th");

if (!th) return;

const thPosition = [...table.querySelectorAll("th")].findIndex(
(thElement) => thElement === th,
);
const arrowUp = th.querySelector("i.fa-chevron-up");
const arrowDown = th.querySelector("i.fa-chevron-down");

const tbody = table.querySelector("tbody");
const rows = [...tbody.querySelectorAll("tr:not(#spinner)")];

const direction = getDirection(arrowUp, arrowDown); // up | down

rows.sort((a, b) => {
const textA = [...a.querySelectorAll("td")][thPosition].textContent;
const textB = [...b.querySelectorAll("td")][thPosition].textContent;
if (direction === "up") return textA.localeCompare(textB);
return textB.localeCompare(textA);
});

state.rowsNeeededToHide = getRowsThatDontMatchSearch(rows, searchInput.value);

// tbody.innerHTML = "";
rows.forEach((row) => {
tbody.appendChild(row); // Reorder the rows in the DOM
});

table.querySelector("i.fa-solid:not(.hidden)")?.classList?.add?.("hidden");

if (direction === "up") {
arrowUp.classList.remove("hidden");
arrowDown.classList.add("hidden");
}

if (direction === "down") {
arrowUp.classList.add("hidden");
arrowDown.classList.remove("hidden");
}

const buttonPagination = [...buttonsPaginationContainer.children].find(
(btn) => Number(btn.textContent.trim()) === state.currentPagination,
);
buttonPagination.dispatchEvent(new Event("click", { bubbles: true }));
});

const getDirection = (arrowUp, arrowDown) => {
if (
arrowUp.classList.contains("hidden") &&
arrowDown.classList.contains("hidden")
) {
return "up";
}

if (arrowUp.classList.contains("hidden")) return "up";
return "down";
};

const buttonsPaginationContainer = document.getElementById(
"container-buttons-pagination",
);

const createPaginationButtons = () => {
const arr = [...tbody.querySelectorAll("tr:not(#spinner)")];
const buttonsQuantity = Math.ceil(arr.length / MAX_TUPLES);
for (let i = 1; i <= buttonsQuantity; i++) {
buttonsPaginationContainer.insertAdjacentHTML(
"beforeend",
`<button class="rounded-sm w-[40px] h-[40px] text-sm">${i}</button>`,
);
}
};

createPaginationButtons();

// PAGINATION
buttonsPaginationContainer.addEventListener("click", (e) => {
const button = e.target.closest(".text-sm");
if (!button) return;

[...buttonsPaginationContainer.children].forEach((btn) =>
btn.classList.remove("bg-indigo-600"),
);

hideTuples(
[...tbody.querySelectorAll("tr:not(#spinner)")],
MAX_TUPLES,
Number(button.textContent.trim()),
new Set(state.rowsNeeededToHide),
);

state.currentPagination = Number(button.textContent.trim());

makeOddRowsDistinguishable();
button.classList.add("bg-indigo-600");
console.log("makeOddRowsDistinguishable");
tbody.classList.remove("first:[&_tr]:table-row");
tbody.classList.remove("[&_tr]:hidden");
tbody.classList.add("first:[&_tr]:hidden");
});

[...tbody.querySelectorAll("tr:not(#spinner)")].forEach(
(child, i) => i % 2 === 1 && child.classList.add("bg-gray-100"),
);

const firstColumn = table.querySelector("th");
firstColumn.dispatchEvent(new Event("click", { bubbles: true }));

const nextButton = document.getElementById("next-button");

nextButton.addEventListener("click", () => {
const btn = [...buttonsPaginationContainer.children].find(
(el) => Number(el.textContent.trim()) === state.currentPagination + 1,
);

if (!btn) return;
btn.dispatchEvent(new Event("click", { bubbles: true }));
});

const previousButton = document.getElementById("previous-button");

previousButton.addEventListener("click", () => {
const btn = [...buttonsPaginationContainer.children].find(
(el) => Number(el.textContent.trim()) === state.currentPagination - 1,
);

if (!btn) return;
btn.dispatchEvent(new Event("click", { bubbles: true }));
});

searchInput.addEventListener("input", (e) => {
const rows = [...tbody.querySelectorAll("tr:not(#spinner)")];

const thSorted = table.querySelector("i.fa-solid:not(.hiden)").closest("th");
thSorted.dispatchEvent(new Event("click", { bubbles: true }));
thSorted.dispatchEvent(new Event("click", { bubbles: true }));
});

</script>