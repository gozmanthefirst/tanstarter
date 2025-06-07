export const Route = createFileRoute({
  beforeLoad: () => { },
  component: Home,
})

function Home() {
  return (
    <div className="py-6 container flex flex-col gap-6 items-center text-center">
      <h1 className="text-4xl font-semibold font-roboto text-center text-primary-600 sm:text-5xl md:text-6xl 2xl:text-7xl">Tanstarter</h1>
      <p className="text-neutral-500 font-jetbrains text-lg font-semibold sm:text-xl md:text-2xl">Mehn! I too love this shit!</p>
    </div>
  )
}
