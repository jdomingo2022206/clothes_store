<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="titles" required="true" rtexprvalue="true" type="java.util.List<java.lang.String>"
              description="it represents the columns titles" %>
<%@ tag description="My Custom Component" pageEncoding="UTF-8" %>
<div class="flex flex-col p-5 h-screen overflow-hidden">
  <div class="flex flex-col gap-3 w-fit max-w-full">
    <div class="flex flex-col gap-2 sm:flex-row sm:justify-between">
      <div class="flex items-center gap-3 font-bold text-gray-700 rounded-md px-3 py-1 bg-gray-200 cursor-pointer">
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
    <div id="table-container" class="overflow-y-scroll rounded-lg border">
      <table
        id="table"
        class="table-auto [&_td]:py-2 [&_th]:py-2 min-w-[700px]"
      >
        <thead class="bg-gray-200 [&_>_*]:cursor-pointer [&_>_*]:font-semibold">
    <tr>
        <c:forEach var="title" items="${titles}">
            <th>
            <div class="flex items-center gap-2 ps-3">
              <span>${title}</span><i class="text-[10px] bg-[#f3f4f6] rounded-sm p-1 text-black fa-solid fa-chevron-up hidden"></i><i class="text-[10px] bg-[#f3f4f6] rounded-sm p-1 text-black fa-solid fa-chevron-down hidden"></i>
            </div>
          </th>
        </c:forEach>
    </tr>
        </thead>
        <tbody class="[&_td]:border-t last:[&_td]:text-indigo-600 last:[&_td]:underline last:[&_td]:cursor-pointer rounded-sm [&_td]:text-gray-500 first:[&_td]:font-semibold first:[&_td]:text-black [&_td]:ps-3 [&_td]:pe-3 [&_tr]:hidden first:[&_tr]:table-row">
          <tr id="spinner">
            <td colspan="5">
              <div role="status" class="flex justify-center items-center">
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
            <jsp:doBody/>
        </tbody>
      </table>
    </div>
    <div class="flex flex-col gap-3 sm:flex-row sm:justify-between w-full sm:items-center border p-2">
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
</div>;



<script defer src="table.js"></script>