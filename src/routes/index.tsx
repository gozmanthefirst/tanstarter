import { createFileRoute } from "@tanstack/react-router";

export const Route = createFileRoute("/")({
  component: App,
});

function App() {
  return (
    <div className="flex min-h-dvh items-center justify-center text-3xl font-semibold md:text-4xl">
      Tanstarter!
    </div>
  );
}
